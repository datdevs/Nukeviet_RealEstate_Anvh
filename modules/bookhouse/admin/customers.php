<?php

/**
 * @Project NUKEVIET 4.x
 * @Author Datdevsx <datdevsx@gmail.com>
 * @Copyright (C) 2021 Vuji. All rights reserved
 * @Createdate 06/02/2021 19:00
 */

if (!defined('NV_IS_FILE_ADMIN')) {
  die('Stop!!!');
}

if ($nv_Request->isset_request('location_get', 'get')) {
  $pid = $nv_Request->get_int('province', 'get', '');
  $did = $nv_Request->get_int('district', 'get', '');

  $location = new Location();

  if ($pid) {
    $array_district = $location->getArrayDistrict('', $pid);
    echo json_encode($array_district);
    die();
  } elseif ($did) {
    $array_ward = $location->getArrayWard('', $did);
    echo json_encode($array_ward);
    die();
  }
} elseif ($nv_Request->isset_request('group_get', 'get')) {
  $page = $nv_Request->get_int('page', 'get', '');

  $page_size = 10;
  $page_total = $db->query('SELECT COUNT(*) FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group')->fetchColumn();

  if ($page === 1) {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group ORDER BY id ASC LIMIT ' . $page_size;
  } elseif ($page === 0) { // Get All
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group ORDER BY id ASC';
  } else {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group ORDER BY id ASC LIMIT ' . ($page_size * ($page - 1)) . ',' . $page_size;
  }

  $result = $db->query($sql)->fetchAll();

  $last_result = [
    'page_total' => $page_total,
    'page_size' => $page_size,
    'result' => $result,
    'current_page' => $page
  ];
  echo json_encode($last_result);
  die();
} elseif ($nv_Request->isset_request('group_add', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Nhóm khách hàng đã được thêm vào thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['title'] = $d->title;
  $row['alias'] = strtolower(change_alias($row['title']));
  $row['status'] = $d->status;

  try {
    $sql = 'INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group (title, alias, status) VALUES (:title, :alias, :status)';

    $row['id'] = $db->insert_id($sql, 'id', $row);

    if ($row['id'] > 0) {
      $status = true;
      $nv_Cache->delMod($module_name);
    } else {
      $status = false;
      echo json_encode($error);
      die();
    }
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('group_update', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Nhóm khách hàng đã được cập nhật thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['id'] = $d->id;
  $row['title'] = $d->title;
  $row['alias'] = strtolower(change_alias($row['title']));
  $row['status'] = $d->status;

  try {
    $stmt = $db->prepare('UPDATE ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group SET title= :title, alias= :alias, status=:status WHERE id=' . $row['id']);
    $stmt->bindParam(':title', $row['title'], PDO::PARAM_STR);
    $stmt->bindParam(':alias', $row['alias'], PDO::PARAM_STR);
    $stmt->bindParam(':status', $row['status'], PDO::PARAM_INT);
    $stmt->execute();

    if ($stmt->rowCount()) {
      $status = true;
    }
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('group_del', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Nhóm khách hàng đã được xóa thành công.',
  ];

  $d = json_decode($data);

  try {
    if (is_array($d)) {
      foreach ($d as $dr) {
        $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group WHERE id=' . $dr->id);
      }
    } else {
      $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group WHERE id=' . $d->id);
    }
    $status = true;
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('get', 'get')) {
  $page = $nv_Request->get_int('page', 'get', '');

  $page_size = 20;
  $page_total = $db->query('SELECT COUNT(*) FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers')->fetchColumn();

  if ($page === 1) {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers ORDER BY id ASC LIMIT ' . $page_size;
  } else {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers ORDER BY id ASC LIMIT ' . ($page_size * ($page - 1)) . ',' . $page_size;
  }

  $result = $db->query($sql)->fetchAll();

  $last_result = [
    'page_total' => $page_total,
    'page_size' => $page_size,
    'result' => $result,
    'current_page' => $page
  ];
  echo json_encode($last_result);
  die();
} elseif ($nv_Request->isset_request('add', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Khách hàng đã được thêm vào thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['groupid'] = $d->groupid ? $d->groupid : 0;
  $row['customer_code'] = $d->customer_code;
  $row['name'] = $d->name;
  $row['alias'] = strtolower(change_alias($row['name'])) . "-" . NV_CURRENTTIME;
  $row['phone'] = $d->phone;
  $row['email'] = $d->email;
  $row['provinceid'] = $d->provinceid ? $d->provinceid : 0;
  $row['districtid'] = $d->districtid ? $d->districtid : 0;
  $row['wardid'] = $d->wardid ? $d->wardid : 0;
  $row['address'] = $d->address ? $d->address : '';
  $row['note'] = $d->note ? $d->note : '';
  $row['source'] = $d->source ? $d->source : '';
  $row['desire'] = $d->desire ? $d->desire : '';

  try {
    $sql = 'INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . '_customers (groupid, customer_code, name, alias, phone, email, provinceid, districtid, wardid, address, note, source, desire) VALUES (:groupid, :customer_code, :name, :alias, :phone, :email, :provinceid, :districtid, :wardid, :address, :note, :source, :desire)';

    $row['id'] = $db->insert_id($sql, 'id', $row);

    if ($row['id'] > 0) {
      $status = true;
      $nv_Cache->delMod($module_name);
    } else {
      $status = false;
      echo json_encode($error);
      die();
    }
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('update', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Khách hàng đã được cập nhật thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['id'] = $d->id;
  $row['groupid'] = $d->groupid ? $d->groupid : 0;
  $row['customer_code'] = $d->customer_code;
  $row['name'] = $d->name;
  $row['alias'] = strtolower(change_alias($row['name'])) . "-" . NV_CURRENTTIME;
  $row['phone'] = $d->phone;
  $row['email'] = $d->email;
  $row['provinceid'] = $d->provinceid ? $d->provinceid : 0;
  $row['districtid'] = $d->districtid ? $d->districtid : 0;
  $row['wardid'] = $d->wardid ? $d->wardid : 0;
  $row['address'] = $d->address ? $d->address : '';
  $row['note'] = $d->note ? $d->note : '';
  $row['source'] = $d->source ? $d->source : '';
  $row['desire'] = $d->desire ? $d->desire : '';

  try {
    $stmt = $db->prepare('UPDATE ' . NV_PREFIXLANG . '_' . $module_data . '_customers SET groupid= :groupid, customer_code= :customer_code, name= :name, alias= :alias, phone= :phone, email= :email, provinceid= :provinceid, districtid= :districtid, wardid= :wardid, address= :address, note= :note, source= :source, desire= :desire WHERE id=' . $row['id']);
    $stmt->bindParam(':groupid', $row['groupid'], PDO::PARAM_INT);
    $stmt->bindParam(':customer_code', $row['customer_code'], PDO::PARAM_STR);
    $stmt->bindParam(':name', $row['name'], PDO::PARAM_STR);
    $stmt->bindParam(':alias', $row['alias'], PDO::PARAM_STR);
    $stmt->bindParam(':phone', $row['phone'], PDO::PARAM_STR);
    $stmt->bindParam(':email', $row['email'], PDO::PARAM_STR);
    $stmt->bindParam(':provinceid', $row['provinceid'], PDO::PARAM_INT);
    $stmt->bindParam(':districtid', $row['districtid'], PDO::PARAM_INT);
    $stmt->bindParam(':wardid', $row['wardid'], PDO::PARAM_INT);
    $stmt->bindParam(':address', $row['address'], PDO::PARAM_STR);
    $stmt->bindParam(':note', $row['note'], PDO::PARAM_STR);
    $stmt->bindParam(':source', $row['source'], PDO::PARAM_STR);
    $stmt->bindParam(':desire', $row['desire'], PDO::PARAM_STR);
    $stmt->execute();

    if ($stmt->rowCount()) {
      $status = true;
    }
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('del', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Nhóm khách hàng đã được xóa thành công.',
  ];

  $d = json_decode($data);

  try {
    if (is_array($d)) {
      foreach ($d as $dr) {
        $check_exists = $db->query('SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions WHERE customer_id=' . $dr->id)->fetchAll();

        if (empty($check_exists)) {
          $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers WHERE id=' . $dr->id);
          $status = true;
        } else {
          $error['mess'] = 'Khách hàng đang có liên kết với giao dịch, vui lòng xóa giao dịch trước khi xóa khách hàng!';
          echo json_encode($error);
          die();
        }
      }
    } else {
      $check_exists = $db->query('SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions WHERE customer_id=' . $d->id)->fetchAll();

      if (empty($check_exists)) {
        $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers WHERE id=' . $d->id);
        $status = true;
      } else {
        $error['mess'] = 'Khách hàng đang có liên kết với giao dịch, vui lòng xóa giao dịch trước khi xóa khách hàng!';
        echo json_encode($error);
        die();
      }
    }
    $status = true;
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('import', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $status = false;
  $error = [
    'code' => 500,
    'mess' => $lang_module['error_database'] . '.',
  ];
  $success = [
    'code' => 200,
    'mess' => 'Danh sách khách hàng đã được thêm vào thành công.',
  ];

  foreach (json_decode($data) as $d) {
    $row = [];

    $row['groupid'] = $d->groupid ? $d->groupid : 0;
    if ($row['groupid'] !== 0) {
      $get_groupid = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers_group WHERE title="' . $row['groupid'] . '"')->fetchColumn();
      if ($get_groupid) {
        $row['groupid'] = $get_groupid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại nhóm khách hàng nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    }

    $row['customer_code'] = $d->customer_code;
    $row['name'] = $d->name;
    $row['alias'] = strtolower(change_alias($row['name'])) . "-" . NV_CURRENTTIME;
    $row['phone'] = $d->phone;
    $row['email'] = $d->email;

    $row['provinceid'] = $d->provinceid ? $d->provinceid : 0;
    if ($row['provinceid'] !== 0) {
      $get_provinceid = $db->query('SELECT provinceid FROM ' . $db_config['prefix'] . '_location_province WHERE title="' . $row['provinceid'] . '"')->fetchColumn();
      if ($get_provinceid) {
        $row['provinceid'] = $get_provinceid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Tỉnh/Thành phố nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    }

    $row['districtid'] = $d->districtid ? $d->districtid : 0;
    if ($row['districtid'] !== 0) {
      $get_districtid = $db->query('SELECT districtid FROM ' . $db_config['prefix'] . '_location_district WHERE title="' . $row['districtid'] . '"')->fetchColumn();
      if ($get_districtid) {
        $row['districtid'] = $get_districtid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Quận/Huyện nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    }

    $row['wardid'] = $d->wardid ? $d->wardid : 0;
    if ($row['wardid'] !== 0) {
      $get_wardid = $db->query('SELECT wardid FROM ' . $db_config['prefix'] . '_location_ward WHERE title="' . $row['wardid'] . '"')->fetchColumn();
      if ($get_wardid) {
        $row['wardid'] = $get_wardid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Phường/Xã nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    }

    $row['address'] = $d->address ? $d->address : '';
    $row['note'] = $d->note ? $d->note : '';
    $row['source'] = $d->source ? $d->source : '';
    $row['desire'] = $d->desire ? $d->desire : '';

    try {
      $sql = 'INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . '_customers (groupid, customer_code, name, alias, phone, email, provinceid, districtid, wardid, address, note, source, desire) VALUES (:groupid, :customer_code, :name, :alias, :phone, :email, :provinceid, :districtid, :wardid, :address, :note, :source, :desire)';

      $row['id'] = $db->insert_id($sql, 'id', $row);

      if ($row['id'] > 0) {
        $status = true;
        $nv_Cache->delMod($module_name);
      } else {
        $status = false;
        echo json_encode($error);
        die();
      }
    } catch (PDOException $e) {
      $error['mess'] = $e->getMessage();
      echo json_encode($error);
      die();
    }
  }

  if ($status) echo json_encode($success);
} elseif ($nv_Request->isset_request('search', 'get')) {
  $data = $nv_Request->get_title('data', 'get', '');

  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];

  $data = str_replace($search, $replace, $data);

  $d = json_decode($data);

  $name = $d->name;
  $phone = $d->phone;
  $groupid = $d->groupid;

  $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers WHERE name LIKE "%' . $name . '%" AND phone LIKE "%' . $phone . '%" ORDER BY id ASC';
  if ($groupid !== '') {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers WHERE name LIKE "%' . $name . '%" AND phone LIKE "%' . $phone . '%" AND groupid=' . $groupid . ' ORDER BY id ASC';
  }
  $result = $db->query($sql)->fetchAll();
  echo json_encode($result);
  die();
} else {
  // $create_customer_table = "CREATE TABLE " . NV_PREFIXLANG . "_" . $module_data . "_customers (
  //   id int(11) unsigned NOT NULL auto_increment,
  //   groupid smallint(5),
  //   customer_code varchar(250) NOT NULL default '',
  //   name varchar(250) NOT NULL default '',
  //   alias varchar(250) NOT NULL default '',
  //   phone varchar(250) NOT NULL default '',
  //   email varchar(250) NOT NULL default '',
  //   provinceid mediumint(4),
  //   districtid mediumint(8),
  //   wardid mediumint(8),
  //   address varchar(250),
  //   note text,
  //   source varchar(250),
  //   desire varchar(250),
  //   PRIMARY KEY (id),
  //   UNIQUE KEY alias (alias)
  //   ) ENGINE=MyISAM COLLATE=utf8mb4_unicode_ci";
  // $create_group_table = "CREATE TABLE " . NV_PREFIXLANG . "_" . $module_data . "_customers_group (
  //   id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  //   title varchar(250) NOT NULL DEFAULT '',
  //   alias varchar(250) NOT NULL DEFAULT '',
  //   status tinyint(4) NOT NULL default '1',
  //   PRIMARY KEY (id),
  //   UNIQUE KEY title (title),
  //   UNIQUE KEY alias (alias)
  //   ) ENGINE=MyISAM COLLATE=utf8mb4_unicode_ci";
  // $db->query($create_customer_table);
  // $db->query($create_group_table);

  $xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);

  $location = new Location();
  $array_province = $location->getArrayProvince();

  $xtpl->assign('ARRAY_PROVINCE', json_encode($array_province));

  $xtpl->parse('main');
  $contents = $xtpl->text('main');

  $page_title = 'Quản lý khách hàng';

  include NV_ROOTDIR . '/includes/header.php';
  echo nv_admin_theme($contents);
  include NV_ROOTDIR . '/includes/footer.php';
}

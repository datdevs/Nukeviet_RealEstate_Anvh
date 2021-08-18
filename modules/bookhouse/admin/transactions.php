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

if ($nv_Request->isset_request('code_update', 'post, get')) {
  $data = $nv_Request->get_title('data', 'post', '');
  $replace = ['&', '\'', '"', '<', '>', '\\', '/', '(', ')', '*', '[', ']', '!', '=', '%', '^', ':', '{', '}', '`', '~'];
  $search = ['&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '&#x005C;', '&#x002F;', '&#40;', '&#41;', '&#42;', '&#91;', '&#93;', '&#33;', '&#x3D;', '&#x25;', '&#x5E;', '&#x3A;', '&#x7B;', '&#x7D;', '&#x60;', '&#x7E;'];
  $data = str_replace($search, $replace, $data);
  $d = json_decode($data);
  try {
    $stmt = $db->prepare('UPDATE ' . NV_PREFIXLANG . '_' . $module_data . '_transactions_type SET transaction_type=:transaction_type');
    $stmt->bindParam(':transaction_type', $d, PDO::PARAM_STR);
    $stmt->execute();
  } catch (PDOException $e) {
    echo json_encode($error);
    die();
  }
} elseif ($nv_Request->isset_request('get', 'get')) {
  $page = $nv_Request->get_int('page', 'get', '');

  $page_size = 20;
  $page_total = $db->query('SELECT COUNT(*) FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions')->fetchColumn();

  if ($page === 1) {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions ORDER BY id ASC LIMIT ' . $page_size;
  } else {
    $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions ORDER BY id ASC LIMIT ' . ($page_size * ($page - 1)) . ',' . $page_size;
  }

  $list_transactions = $db->query($sql)->fetchAll();

  foreach ($list_transactions as $key => $transaction) {
    $sql_customer = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers WHERE id=' . $transaction['customer_id'];
    $get_customer_info = $db->query($sql_customer)->fetch();
    $list_transactions[$key]['customer'] = $get_customer_info;
  }

  $last_result = [
    'page_total' => $page_total,
    'page_size' => $page_size,
    'result' => $list_transactions,
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
    'mess' => 'Giao dịch đã được tạo vào thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['transaction_code'] = NV_CURRENTTIME;
  $row['customer_id'] = $d->customer_id;
  $row['bds_id'] = $d->bds_id ? $d->bds_id : '';
  $row['bds_link'] = $d->bds_link ? $d->bds_link : '';
  $row['note'] = $d->note ? $d->note : '';
  $row['start_date'] = $d->start_date ? $d->start_date : 0;
  $row['end_date'] = $d->end_date ? $d->end_date : 0;
  $row['status'] = $d->status ? $d->status : 1;

  try {
    $sql = 'INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . '_transactions (transaction_code, customer_id, bds_id, bds_link, note, start_date, end_date, status) VALUES (:transaction_code, :customer_id, :bds_id, :bds_link, :note, :start_date, :end_date, :status)';

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
    'mess' => 'Giao dịch đã được cập nhật thành công.',
  ];

  $d = json_decode($data);

  $row = [];
  $row['id'] = $d->id;
  $row['customer_id'] = $d->customer_id;
  $row['bds_id'] = $d->bds_id ? $d->bds_id : '';
  $row['bds_link'] = $d->bds_link ? $d->bds_link : '';
  $row['note'] = $d->note ? $d->note : '';
  $row['start_date'] = $d->start_date ? $d->start_date : 0;
  $row['end_date'] = $d->end_date ? $d->end_date : 0;
  $row['status'] = $d->status ? $d->status : 1;

  try {
    $stmt = $db->prepare('UPDATE ' . NV_PREFIXLANG . '_' . $module_data . '_transactions SET customer_id= :customer_id, bds_id= :bds_id, bds_link= :bds_link, note= :note, start_date= :start_date, end_date= :end_date, status= :status WHERE id=' . $row['id']);
    $stmt->bindParam(':customer_id', $row['customer_id'], PDO::PARAM_INT);
    $stmt->bindParam(':bds_id', $row['bds_id'], PDO::PARAM_STR);
    $stmt->bindParam(':bds_link', $row['bds_link'], PDO::PARAM_STR);
    $stmt->bindParam(':note', $row['note'], PDO::PARAM_STR);
    $stmt->bindParam(':start_date', $row['start_date'], PDO::PARAM_INT);
    $stmt->bindParam(':end_date', $row['end_date'], PDO::PARAM_INT);
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
    'mess' => 'Giao dịch đã được xóa thành công.',
  ];

  $d = json_decode($data);

  try {
    if (is_array($d)) {
      foreach ($d as $dr) {
        $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions WHERE id=' . $dr->id);
      }
    } else {
      $db->query('DELETE FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions WHERE id=' . $d->id);
    }
    $status = true;
  } catch (PDOException $e) {
    $error['mess'] = $e->getMessage();
    echo json_encode($error);
    die();
  }

  if ($status) echo json_encode($success);
} else {
  // $create_transaction_table = "CREATE TABLE " . NV_PREFIXLANG . "_" . $module_data . "_transactions (
  //   id int(11) unsigned NOT NULL auto_increment,
  //   transaction_code bigint(20) NOT NULL,
  //   customer_id int(11) NOT NULL,
  //   bds_id varchar(250),
  //   bds_link text,
  //   note text,
  //   start_date bigint(20),
  //   end_date bigint(20),
  //   status tinyint(4) NOT NULL default '1',    
  //   PRIMARY KEY (id)
  //   ) ENGINE=MyISAM COLLATE=utf8mb4_unicode_ci";
  // $db->query($create_transaction_table);

  // $create_transaction_type_table = "CREATE TABLE " . NV_PREFIXLANG . "_" . $module_data . "_transactions_type (
  //   transaction_type varchar(250)
  //   ) ENGINE=MyISAM COLLATE=utf8mb4_unicode_ci";
  // $db->query($create_transaction_type_table);

  $xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);

  $sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_customers ORDER BY name ASC';
  $list_customers = $db->query($sql)->fetchAll();

  $sql = 'SELECT transaction_type FROM ' . NV_PREFIXLANG . '_' . $module_data . '_transactions_type';
  $transaction_type = $db->query($sql)->fetchColumn();

  $xtpl->assign('LIST_CUSTOMERS', json_encode($list_customers));
  $xtpl->assign('TRANSACTION_TYPE', json_encode($transaction_type));

  $xtpl->parse('main');
  $contents = $xtpl->text('main');

  $page_title = 'Quản lý giao dịch';

  include NV_ROOTDIR . '/includes/header.php';
  echo nv_admin_theme($contents);
  include NV_ROOTDIR . '/includes/footer.php';
}

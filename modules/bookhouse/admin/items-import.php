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

if ($nv_Request->isset_request('import', 'post, get')) {
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
    'mess' => 'Danh sách dự án đã được thêm vào thành công.',
  ];

  foreach (json_decode($data) as $d) {
    $row = [];

    $row['title'] = $d->title;
    $row['alias'] = strtolower(change_alias($row['title']));
    if ($d->catid) {
      $get_catid = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_categories WHERE title="' . $d->catid . '"')->fetchColumn();
      if ($get_catid) {
        $row['catid'] = $get_catid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Loại BĐS nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Loại BĐS nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    $row['phong_khach'] = $d->phong_khach ? $d->phong_khach : 0;
    $row['phong_ngu'] = $d->phong_ngu ? $d->phong_ngu : 0;
    $row['phong_tam'] = $d->phong_tam ? $d->phong_tam : 0;
    $row['hometext'] = $d->hometext ? $d->hometext : 'Đang cập nhật';
    $row['bodytext'] = $d->bodytext ? $d->bodytext : 'Đang cập nhật';
    $row['admin_id'] = $admin_info['admin_id'];
    $row['exptime'] = 0;
    $row['code'] = '';
    $row['area'] = $d->area ? $d->area : 0;
    $row['size_v'] = 0;
    $row['size_h'] = 0;
    $row['price'] = $d->price ? $d->price : 0;
    $row['price_time'] = 0;
    $row['money_unit'] = 'vnd';
    if ($d->typeid) {
      $get_typeid = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_type WHERE title="' . $d->typeid . '"')->fetchColumn();
      if ($get_typeid) {
        $row['typeid'] = $get_typeid;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Hình thức nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Hình thức nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    $row['projectid'] = $d->projectid ? $d->projectid : 0;
    if ($d->way) {
      $get_way_id = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_way WHERE title="' . $d->way . '"')->fetchColumn();
      if ($get_way_id) {
        $row['way_id'] = $get_way_id;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Hướng nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Hướng nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    if ($d->legal) {
      $get_legal_id = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_legal WHERE title="' . $d->legal . '"')->fetchColumn();
      if ($get_legal_id) {
        $row['legal_id'] = $get_legal_id;
      } else {
        $error['mess'] = 'Vui lòng kiểm tra lại Pháp lý nhập chưa chính xác.';
        echo json_encode($error);
        die();
      }
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Pháp lý nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    $row['homeimgfile'] = $d->homeimgfile ? $d->homeimgfile : '';
    $row['homeimgthumb'] = 3;
    $row['homeimgalt'] = '';
    $row['front'] = $d->front ? $d->front : 0;
    $row['road'] = $d->road ? $d->road : 0;
    if ($d->noi_that) {
      $get_id_noithat = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_furniture WHERE weight IN (' . $d->noi_that . ')')->fetchAll(PDO::FETCH_COLUMN);
      $row['noi_that'] = implode(',', $get_id_noithat);
    } else {
      $row['noi_that'] = '';
    }
    if ($d->tien_ich) {
      $get_id_tienich = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_convenient WHERE weight IN (' . $d->tien_ich . ')')->fetchAll(PDO::FETCH_COLUMN);
      $row['tien_ich'] = implode(',', $get_id_tienich);
    } else {
      $row['tien_ich'] = '';
    }
    $row['structure'] = $d->structure ? $d->structure : '';
    $get_location = $db->query('SELECT provinceid, districtid, wardid FROM ' . NV_PREFIXLANG . '_' . $module_data . '_projects WHERE id=' . $d->projectid)->fetch();
    if ($get_location) {
      $row['provinceid'] = $get_location['provinceid'] ? $get_location['provinceid'] : 0;
      $row['districtid'] = $get_location['districtid'] ? $get_location['districtid'] : 0;
      $row['wardid'] = $get_location['wardid'] ? $get_location['wardid'] : 0;
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Mã dự án nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    $row['address'] = $d->address ? $d->address : '';
    $row['maps'] = '';
    $row['inhome'] = 1;
    $row['allowed_comm'] = 6;
    $row['showprice'] = 1;
    $row['contact_fullname'] = $d->contact_fullname ? $d->contact_fullname : '';
    $row['contact_email'] = $d->contact_email ? $d->contact_email : '';
    $row['contact_phone'] = $d->contact_phone ? $d->contact_phone : '';
    $row['contact_address'] = $d->contact_address ? $d->contact_address : '';
    $row['ordertime'] = NV_CURRENTTIME;

    try {
      $sql = 'INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . ' (title, alias, catid, group_config, phong_khach, phong_ngu, phong_tam, hometext, bodytext, admin_id, addtime, edittime, exptime, code, area, size_v, size_h, price, price_time, money_unit, typeid, projectid, way_id, legal_id, homeimgfile, homeimgthumb, homeimgalt, front, road, noi_that, tien_ich, structure, provinceid, districtid, wardid, address, maps, inhome, allowed_comm, hitstotal, showprice, contact_fullname, contact_email, contact_phone, contact_address, ordertime, type) VALUES (:title, :alias, :catid, "", :phong_khach, :phong_ngu, :phong_tam, :hometext, :bodytext, :admin_id, ' . NV_CURRENTTIME . ', ' . NV_CURRENTTIME . ', :exptime, :code, :area, :size_v, :size_h, :price, :price_time, :money_unit, :typeid, :projectid, :way_id, :legal_id, :homeimgfile, :homeimgthumb, :homeimgalt, :front, :road, :noi_that, :tien_ich, :structure, :provinceid, :districtid, :wardid, :address, :maps, :inhome, :allowed_comm, 0, :showprice, :contact_fullname, :contact_email, :contact_phone, :contact_address, :ordertime, "")';

      $row['id'] = $db->insert_id($sql, 'id', $row);

      if ($row['id'] > 0) {
        $status = true;
        $nv_Cache->delMod($module_name);
        nv_insert_logs(NV_LANG_DATA, $module_name, $lang_module['logs_add_items'], $row['title'], $admin_info['userid']);
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
} else {
  $xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);

  $xtpl->parse('main');
  $contents = $xtpl->text('main');

  $page_title = 'Nhập danh sách Excel Bất động sản';

  include NV_ROOTDIR . '/includes/header.php';
  echo nv_admin_theme($contents);
  include NV_ROOTDIR . '/includes/footer.php';
}

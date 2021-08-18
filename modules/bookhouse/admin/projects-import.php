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
    $row['dientichxd'] = $d->dientichxd ? $d->dientichxd : '';
    $row['thoigianxd'] = $d->thoigianxd ? $d->thoigianxd : '';
    $row['thoigiangn'] = $d->thoigiangn ? $d->thoigiangn : '';
    $row['vondautu'] = $d->vondautu ? $d->vondautu : '';
    $row['chudautu'] = $d->chudautu ? $d->chudautu : '';
    $row['dientich'] = $d->dientich ? $d->dientich : '';
    $row['sophong'] = $d->sophong ? $d->sophong : '';
    $row['soblock'] = $d->soblock ? $d->soblock : '';
    $row['sotang'] = $d->sotang ? $d->sotang : '';
    $row['socanho'] = $d->socanho ? $d->socanho : '';
    $row['khonggianxanh'] = $d->khonggianxanh ? $d->khonggianxanh : '';
    $row['matdo'] = $d->matdo ? $d->matdo : '';
    $row['phiquanly'] = $d->phiquanly ? $d->phiquanly : '';
    $row['giuoto'] = $d->giuoto ? $d->giuoto : '';
    $row['giuxemay'] = $d->giuxemay ? $d->giuxemay : '';
    $row['giaban'] = $d->giaban ? $d->giaban : '';
    $row['giathue'] = $d->giathue ? $d->giathue : '';

    if ($d->tienich) {
      $get_id_tienich = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_convenient WHERE weight IN (' . $d->tienich . ')')->fetchAll(PDO::FETCH_COLUMN);
      $row['tienich'] = implode(',', $get_id_tienich);
    } else {
      $row['tienich'] = '';
    }

    if ($d->noithat) {
      $get_id_noithat = $db->query('SELECT id FROM ' . NV_PREFIXLANG . '_' . $module_data . '_furniture WHERE weight IN (' . $d->noithat . ')')->fetchAll(PDO::FETCH_COLUMN);
      $row['noithat'] = implode(',', $get_id_noithat);
    } else {
      $row['noithat'] = '';
    }

    $row['inhome'] = 0;
    $row['description'] = $d->description ? $d->description : 'Đang cập nhật';
    $row['descriptionhtml'] = $d->descriptionhtml ? $d->descriptionhtml : 'Đang cập nhật';

    $get_provinceid = $db->query('SELECT provinceid FROM ' . $db_config['prefix'] . '_location_province WHERE title="' . $d->provinceid . '"')->fetchColumn();
    $get_districtid = $db->query('SELECT districtid FROM ' . $db_config['prefix'] . '_location_district WHERE title="' . $d->districtid . '"')->fetchColumn();
    $get_wardid = $db->query('SELECT wardid FROM ' . $db_config['prefix'] . '_location_ward WHERE title="' . $d->wardid . '"')->fetchColumn();

    if ($get_provinceid) {
      $row['provinceid'] = $get_provinceid;
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Tỉnh/Thành phố nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    if ($get_districtid) {
      $row['districtid'] = $get_districtid;
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Quận/Huyện nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    if ($get_wardid) {
      $row['wardid'] = $get_wardid;
    } else {
      $error['mess'] = 'Vui lòng kiểm tra lại Phường/Xã nhập chưa chính xác.';
      echo json_encode($error);
      die();
    }
    $row['address'] = $d->address ? $d->address : '';
    $row['maps'] = '';

    if ($d->image) {
      $img = explode(',', $d->image);
      $row['homeimg'] = $img[0];
      $row['image'] = implode('|', $img);
    } else {
      $row['homeimg'] = '';
      $row['image'] = '';
    }

    try {
      $stmt = $db->prepare('INSERT INTO ' . NV_PREFIXLANG . '_' . $module_data . '_projects (title, alias, dientichxd, thoigianxd, thoigiangn, vondautu, chudautu, dientich, sophong, soblock, sotang, socanho, khonggianxanh, matdo, phiquanly, giuoto, giuxemay, giaban, giathue, tienich, noithat, inhome, description, descriptionhtml, provinceid, districtid, wardid, address, maps, homeimg, image) VALUES (:title, :alias, :dientichxd,:thoigianxd,:thoigiangn,:vondautu,:chudautu,:dientich,:sophong,:soblock,:sotang,:socanho,:khonggianxanh, :matdo, :phiquanly, :giuoto, :giuxemay, :giaban, :giathue, :tienich, :noithat, :inhome,:description, :descriptionhtml, :provinceid, :districtid, :wardid, :address, :maps, :homeimg, :image)');
      $stmt->bindParam(':title', $row['title'], PDO::PARAM_STR);
      $stmt->bindParam(':alias', $row['alias'], PDO::PARAM_STR);
      $stmt->bindParam(':dientichxd', $row['dientichxd'], PDO::PARAM_STR);
      $stmt->bindParam(':thoigianxd', $row['thoigianxd'], PDO::PARAM_STR);
      $stmt->bindParam(':thoigiangn', $row['thoigiangn'], PDO::PARAM_STR);
      $stmt->bindParam(':vondautu', $row['vondautu'], PDO::PARAM_STR);
      $stmt->bindParam(':chudautu', $row['chudautu'], PDO::PARAM_STR);
      $stmt->bindParam(':dientich', $row['dientich'], PDO::PARAM_STR);
      $stmt->bindParam(':sophong', $row['sophong'], PDO::PARAM_STR);
      $stmt->bindParam(':soblock', $row['soblock'], PDO::PARAM_STR);
      $stmt->bindParam(':sotang', $row['sotang'], PDO::PARAM_STR);
      $stmt->bindParam(':socanho', $row['socanho'], PDO::PARAM_STR);
      $stmt->bindParam(':khonggianxanh', $row['khonggianxanh'], PDO::PARAM_STR);
      $stmt->bindParam(':matdo', $row['matdo'], PDO::PARAM_STR);
      $stmt->bindParam(':phiquanly', $row['phiquanly'], PDO::PARAM_STR);
      $stmt->bindParam(':giuoto', $row['giuoto'], PDO::PARAM_STR);
      $stmt->bindParam(':giuxemay', $row['giuxemay'], PDO::PARAM_STR);
      $stmt->bindParam(':giaban', $row['giaban'], PDO::PARAM_STR);
      $stmt->bindParam(':giathue', $row['giathue'], PDO::PARAM_STR);
      $stmt->bindParam(':tienich', $row['tienich'], PDO::PARAM_STR);
      $stmt->bindParam(':noithat', $row['noithat'], PDO::PARAM_STR);
      $stmt->bindParam(':inhome', $row['inhome'], PDO::PARAM_INT);
      $stmt->bindParam(':description', $row['description'], PDO::PARAM_STR, strlen($row['description']));
      $stmt->bindParam(':descriptionhtml', $row['descriptionhtml'], PDO::PARAM_STR, strlen($row['descriptionhtml']));
      $stmt->bindParam(':provinceid', $row['provinceid'], PDO::PARAM_STR);
      $stmt->bindParam(':districtid', $row['districtid'], PDO::PARAM_STR);
      $stmt->bindParam(':wardid', $row['wardid'], PDO::PARAM_STR);
      $stmt->bindParam(':address', $row['address'], PDO::PARAM_STR);
      $stmt->bindParam(':maps', $row['maps'], PDO::PARAM_STR);
      $stmt->bindParam(':homeimg', $row['homeimg'], PDO::PARAM_STR);
      $stmt->bindParam(':image', $row['image'], PDO::PARAM_STR, strlen($row['image']));
      $exc = $stmt->execute();
      if ($exc) {
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
} else {
  $xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);

  $xtpl->parse('main');
  $contents = $xtpl->text('main');

  $page_title = 'Thêm danh sách dự án';

  include NV_ROOTDIR . '/includes/header.php';
  echo nv_admin_theme($contents);
  include NV_ROOTDIR . '/includes/footer.php';
}

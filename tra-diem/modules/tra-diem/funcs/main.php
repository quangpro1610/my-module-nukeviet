<?php

/**
 * @Project TRADIEMTOTNGHIEPTHPT
 * @Author HOANG QUANG <quangpro1610@gmail.com>
 * @Copyright (C) 2021 HOANG QUANG. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sun, 20 Jun 2021 13:37:57 GMT
 */

if (!defined('NV_MOD_TRA_DIEM')) {
    die('Stop!!!');
}

$page_title = 'Tra điểm thi Tốt nghiệp';
$years = array();

for ($y = date('Y'); $y >= 2019 ; $y--) { 
    $years[] = $y;
}

if ($nv_Request->isset_request('search_submit', 'post')) {

    $radio_val = $nv_Request->get_title('optradio', 'post');
    $city_code = $nv_Request->get_title('city', 'post');
    $subject = $nv_Request->get_title('subject', 'post');
    $year = $nv_Request->get_int('year', 'post');

    if ($radio_val == 'Top100') {
        $request_url = 'https://diemthi.vnanet.vn/Home/Top100_PTTH?citycode=' . $city_code . '&mon=' . $subject . '&nam=' . $year;
        $content = file_get_contents($request_url);
        $data = json_decode($content, true);
        $result = json_decode($data['result']['0']['Ketqua'], true);  
    } else {
        $request_url = 'https://diemthi.vnanet.vn/Home/ShowChartPhoDiem_THPT?id=&city=' . $city_code . '&score=' . $subject . '&nam=' . $year;
        $content = file_get_contents($request_url);
        $data = json_decode($content, true);
        $result = $data['result']['0']['Result'];
    }

}

$contents = ket_qua($result, $subject, $years, $year, $city_code, $radio_val);

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';

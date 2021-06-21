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

function ket_qua($data, $subject, $years, $current, $city_code, $radio_val)
{
    global $module_file, $module_info, $module_name;
    $subjects = array(
        'Toan'     => 'Toán', 
        'NguVan'   => 'Ngữ văn', 
        'NgoaiNgu' => 'Ngoại Ngữ', 
        'VatLi'    => 'Vật lí', 
        'HoaHoc'   => 'Hóa', 
        'SinhHoc'  => 'Sinh học', 
        'KHTN'     => 'KHTN', 
        'LichSu'   => 'Lịch sử', 
        'DiaLi'    => 'Địa lí', 
        'GDCD'     => 'GDCD', 
        'KHXH'     => 'KHXH'
    );
    $area = array();
    $area_file = file_get_contents(dirname(__FILE__) . '/area.txt');
    $area_file_arr = explode("\n", $area_file);

    foreach ($area_file_arr as $key => $line) {
        $split = explode(',', $line);
        $area[] = array(
            'id' => $split[0],
            'name' => $split[1],
        );
    } 

    $xtpl = new XTemplate('main.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file);
    $xtpl->assign('FORM_ACTION', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name);

    if (!empty($subjects)) {
        foreach ($subjects as $key => $s) {
            $xtpl->assign('SUBJECTID', array(
                'key' => $key,
                'value' => $s,
                'selected' => ($key == $subject) ? 'selected' : ''
            ));
             $xtpl->parse('main.subjectid');
        }
    }

    if (!empty($years)) {
        foreach ($years as $key => $year) {
            $xtpl->assign('YEAR', array(
                'key' => $year,
                'selected' => ($year == $current) ? 'selected' : ''
            ));
            $xtpl->parse('main.year');
        }
    }

    if (!empty($area)) {
        foreach ($area as $key => $a) {
            $xtpl->assign('AREA', array(
                'id' => $a['id'],
                'name' => $a['name'],
                'selected' => ($a['id'] == $city_code) ? 'selected' : '',
            ));
            $xtpl->parse('main.area');
        }
    }

    if ($radio_val == 'Top100') {
        $i = 0;
        $toan = $li = $hoa = $sinh = $van = $su = $dia = $anh = $gdcd = $khtn = $khxh = '';
        foreach ($data as $key => $item) {
            $i++;

            if (array_key_exists('Toan',$item) && $subject == 'Toan') {
                $toan = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('TOAN', $toan);
            }

            if (array_key_exists('VatLi',$item) && $subject == 'VatLi') {
                $li = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('VL', $li);
            }

            if (array_key_exists('HoaHoc',$item) && $subject == 'HoaHoc') {
                $hoa = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('HH', $hoa);
            }

            if (array_key_exists('SinhHoc',$item) && $subject == 'SinhHoc') {
                $sinh = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('SH', $sinh);
            }

            if (array_key_exists('NguVan',$item) && $subject == 'NguVan') {
                $van = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('VAN', $van);
            }

            if (array_key_exists('LichSu',$item) && $subject == 'LichSu') {
                $su = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('LS', $su);
            }

            if (array_key_exists('DiaLi',$item) && $subject == 'DiaLi') {
                $dia = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('DL', $dia);
            }

            if (array_key_exists('NgoaiNgu',$item) && $subject == 'NgoaiNgu') {
                $anh = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('NN', $anh);
            }

            if (array_key_exists('GDCD',$item) && $subject == 'GDCD') {
                $gdcd = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('GDCD', $gdcd);
            }

            if (array_key_exists('KHTN',$item) && $subject == 'KHTN') {
                $khtn = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('KHTN', $khtn);
            }

            if (array_key_exists('KHXH',$item) && $subject == 'KHXH') {
                $khxh = 'style="background-color: #b7efb7;font-weight: bold;"';
                $xtpl->assign('KHXH', $khxh);
            }

            $xtpl->assign('NO', $i);
            $xtpl->assign('DATA', $item);
            $xtpl->parse('main.show_top100.item');
        }

        if (!in_array($subject, $subjects)) {
            $name = $subjects[$subject];
            $xtpl->assign('SUBJECT', $name);
        }     

        if (!empty($current)) {
            $xtpl->assign('CURRENT', $current);
        }

        if (!in_array($city_code, $area)) {
            $f = floor($city_code);
            if ($f > 19) {
                $xtpl->assign('CITY', array(
                    'key' => $city_code,
                    'title' => $area[$f-1]['name']
                ));
            } else {
                $xtpl->assign('CITY',array(
                    'key' => $city_code,
                    'title' => $area[$f]['name']
                ));
            }
        }
        $xtpl->parse('main.show_top100');
    } else {
        $xtpl->assign('VENDOR_KENDO', NV_STATIC_URL . NV_ASSETS_DIR . '/' . $module_file . '/kendo');
        $xtpl->assign('DATA', $data);
        $xtpl->assign('SUBJECT', $subject);
        $xtpl->parse('main.show_pho_diem');
    }

    $xtpl->parse('main');
    return $xtpl->text('main');
}

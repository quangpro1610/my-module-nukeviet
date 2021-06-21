<?php

/**
 * @Project TRADIEMTOTNGHIEPTHPT
 * @Author HOANG QUANG <quangpro1610@gmail.com>
 * @Copyright (C) 2021 HOANG QUANG. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sun, 20 Jun 2021 13:37:57 GMT
 */

if (!defined('NV_ADMIN') or !defined('NV_MAINFILE')) {
    die('Stop!!!');
}

$module_version = [
    'name' => 'Tra cứu điểm thi Tốt nghiệp',
    'modfuncs' => 'main',
    'is_sysmod' => 1,
    'virtual' => 0,
    'version' => '4.5.00',
    'date' => 'Sunday, 20 June 2021 13:37:57 GMT',
    'author' => 'HOANG QUANG <quangpro1610@gmail.com>',
    'note' => '',
    'uploads_dir' => [
        $module_upload
    ]
];

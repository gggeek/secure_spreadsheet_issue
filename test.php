#!/usr/bin/env php
<?php

require_once(__DIR__ . '/vendor/autoload.php');

use Nick\SecureSpreadsheet\Encrypt;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();
$activeWorksheet = $spreadsheet->getActiveSheet();
$activeWorksheet->setCellValue('A1', 'Hello World !');

$writer = new Xlsx($spreadsheet);
$f = fopen('php://memory', 'r+');
$writer->save($f);
rewind($f);
$out = stream_get_contents($f);

file_put_contents('111.xlsx', $out);

$e = new Encrypt(true);
$out = $e->input($out)->password('111a')->output();
file_put_contents('111a.xlsx', $out);

 echo "Saved files '111.xlsx' and '111a.xlsx' to the current dir\n";

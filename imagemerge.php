#!/usr/bin/php

<?php
$newwidth = 1366;
$newheight = 768;

$bcg_filename = $argv[1];
$img_filename = '/home/Behrom/Pictures/Wallpapers/you-should-be-working-now.png';

$bcg = new Imagick();

$bcg->readImage($bcg_filename);    
$bcg->resizeImage($newwidth, $newheight, Imagick::FILTER_LANCZOS, 1);

$img = new Imagick();
$img->readImage($img_filename);    

$bcg->compositeImage($img, \Imagick::COMPOSITE_ATOP, 0, 0);

$bcg->writeImage($bcg_filename);

$bcg->clear();
$bcg->destroy(); 

$img->clear();
$img->destroy(); 
?>

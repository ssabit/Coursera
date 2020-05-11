<?php
/**
 * Created by PhpStorm.
 * User: saad_Sabit
 * Date: 2020-04-29
 * Time: 8:13 PM
 */

$pdo = new PDO('mysql:host=localhost;dbname=misc', 'root', '');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


<?php

$host = 'mysql';
$user = 'ARYA';
$password = 'root';
$db = 'AryaTel';

$conn = mysqli_connect($host, $user, $password, $db);

if (!$conn) {
    echo "connection error --> " . mysqli_connect_error();
}
?>

<?php
    $hostname = 'localhost';
	$username = 'root';
	$password = '';
	$dbname   = 'galeriii';
	
	$db = mysqli_connect($hostname, $username, $password, $dbname) or die ('gagal terhubung ke database');
?>
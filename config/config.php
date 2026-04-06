<?php

session_start();

define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_USER', getenv('DB_USER') ?: 'root');     
define('DB_PASS', getenv('DB_PASS') !== false ? getenv('DB_PASS') : '');         
define('DB_NAME', getenv('DB_NAME') ?: 'webbanhang');

try {
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    
    if (!$conn) {
        throw new Exception("Kết nối thất bại: " . mysqli_connect_error());
    }
    
    mysqli_set_charset($conn, "utf8");

} catch (Exception $e) {
    die("Lỗi: " . $e->getMessage());
}


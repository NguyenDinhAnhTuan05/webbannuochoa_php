<?php
require_once './config/config.php';
require_once './functions/functions.php';

session_start();
session_destroy();
header('Location: login.php');
exit();
?> 
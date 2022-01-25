<?php 
session_start();
if (isset($_SESSION['is_login'])) {
	session_destroy();
    echo "<script>document.location.href='index.php';</script>";
	
}
?>
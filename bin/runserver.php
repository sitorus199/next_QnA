<?php
	function runserver(){
		echo exec("php server.php 2>&1 > /dev/null");
		echo "hallo masuk sini?";
// include("server.php");
	}
runserver();
echo "hei?";
?>

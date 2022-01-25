<?php

//Database_connection.php

class Database_connection
{
	function connect()
	{
		// $connect = new PDO("mysql:host=192.168.18.11; dbname=lumintu-qna", "pintar_dev", "pintar123");
		$connect = new PDO("mysql:host=localhost; dbname=lumintu_qna", "root", "Adminqna1234");

		return $connect;
	}
}

?>

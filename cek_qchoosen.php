<?php 
	function cek_qchoosen($id_session){
		require("database/connection.php");
		$sql_sesi = "SELECT * FROM messages WHERE status=1 AND id_chat=".$id_session;
	    $result = $conn->query($sql_sesi);
	    if ($result->num_rows > 0) {
	        return "1";
		} else {
			return "2";
		}
	}
?>
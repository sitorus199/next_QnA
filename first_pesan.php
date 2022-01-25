<?php 
	function first_pesan(){
		require("database/connection.php");
		$sql_sesi = "SELECT * FROM messages WHERE status=1 AND id_chat=1";
		$result = $conn->query($sql_sesi);
		while($row = $result->fetch_assoc()) {
			$nama_peserta2 = get_nama($row["id_pengirim"]);
			echo '<div class="carousel-item active">
		            <div class="container  px-5" >
		            <h3 class="card-title text-dark mx-3 px-5">
		            '.$row["pesan"].'
		            </h3>
		            <hr class=" mt-5 mx-5 ">
		            <h3 class=" mx-3 px-5 fw-bold">'.$nama_peserta2.'</h3S>
		            </div>
		            </div>';
		    die();
		}
	}

?> 
<?php
	require("connection.php");
	$sql_sesi = "SELECT sessions.id_session, sessions.session_name, sessions.start, sessions.finish, events.id_event, events.nama_event FROM sessions 
		JOIN events ON sessions.id_event=events.id_event";
    $result = $conn->query($sql_sesi);
    // fungsi untuk menentukan sesi chat sudah berjalan atau belum 
    function getStatus($id_sesi){
		$sql_status = "SELECT count(*) from chats where id_session=$id_sesi";
		$conn = mysqli_connect("localhost", "root", "", "lumintu_qna");
		$result1 = $conn->query($sql_status);
		$row1 = $result1->fetch_array();
		if ($row1[0] == 0){
			return "primary'>Segera";
		} else {
			return "success'>Berjalan";
		}
	}
	#fungsi untuk 
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        	$time_start = $row["start"];
        	$time_end = $row["finish"];
        	if(new DateTime() > new DateTime($time_start)){ // jika waktu mulainya sudah lewat 
	        	if (new DateTime() < new DateTime($time_end)){ // jika waktu selesainya blm lewat
	        		$dt = strtotime($row["start"]);
		        	$dt2 = strtotime($row["finish"]);
		        	$day = date("D", $dt);
		        	$tanggal = date("d M Y", $dt);
		        	$jam_mulai = date("H:i", $dt);
		        	$jam_berakhir = date("H:i", $dt2);
				    echo "<div class='mb-2 col-lg-3 col-md-6 col-sm-12'>
				        <div class='card border-0' style='background-color:#ffffff;'>
				            <img src='../assets/event".$row["id_event"].".jpg' class='card-img-top' alt='...' style='height: 140px;'>
				            <div class='card-body text-center'>
				            <h6 class='card-title fw-bold'>".$row["nama_event"]."</h6>
				            <p class='card-text'><small>".$day.", ".$tanggal. "<br>".$row["session_name"]." | ".$jam_mulai." - ".$jam_berakhir."</small></p>
				            <a href='admin_chatroom.php?id_session=".$row["id_session"]."' class='btn btn-sm btn-".getStatus($row["id_session"])."</a>
				            </div>
				        </div>
				    </div>";
	        	} else {
	        		echo "";
	        	}
		   	} else {
		   		$dt = strtotime($row["start"]);
	        	$dt2 = strtotime($row["finish"]);
	        	$day = date("D", $dt);
	        	$tanggal = date("d M Y", $dt);
	        	$jam_mulai = date("H:i", $dt);
	        	$jam_berakhir = date("H:i", $dt2);
			    echo "<div class='mb-2 col-lg-3 col-md-6 col-sm-12'>
			        <div class='card border-0' style='background-color:#ffffff;'>
			            <img src='../assets/event".$row["id_event"].".jpg' class='card-img-top' alt='...' style='height: 140px;'>
			            <div class='card-body text-center'>
			            <h6 class='card-title fw-bold'>".$row["nama_event"]."</h6>
			            <p class='card-text'><small>".$day.", ".$tanggal. "<br>".$row["session_name"]." | ".$jam_mulai." - ".$jam_berakhir."</small></p>
			            <a href='admin_chatroom.php?id_session=".$row["id_session"]."' class='btn btn-sm btn-".getStatus($row["id_session"])."</a>
			            </div>
			        </div>
			    </div>

			    <script>
			    </script>";
		   	}
		}
	} else {
    echo "0 results";
    }   
    $conn->close();
?>
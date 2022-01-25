<?php
//echo exec("php /../bin/server.php > /dev/null 2>&1");
include("connection.php");
$id_chat = $_GET['id_session'];
$id_session = $_GET['id_session'];
$sql = mysqli_query($conn, "SELECT * from chatrooms WHERE id_session='$id_session'");
$cek = mysqli_num_rows($sql);

$url_sesi = "https://api-ticket.arisukarno.xyz/items/session?fields=session_id,start_time,finish_time&filter[session_id]=".$id_session;
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $url_sesi);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
$response_sesi = curl_exec($curl);
$hasil_sesi = json_decode($response_sesi, true);
curl_close($curl);

$jam_mulai = $hasil_sesi["data"][0]["start_time"];
$jam_selesai = $hasil_sesi["data"][0]["finish_time"];
$list_port = array(8081, 8082, 8083, 8084, 8085, 8086);

	if ($cek > 0) {
		//if ( new DateTime("2021-12-01T17:00:00") >= new DateTime($jam_mulai) && new DateTime("2021-12-01T18:00:00") < new DateTime($jam_selesai) ){ // SUDAH BERJALAN
			echo "<script>alert('Memasuki Chatroom!');document.location.href='../admin/admin_chatroom.php?id_session=".$id_chat."';</script>";
		//} else { // SUDAH SELESAI
		//	$sql2 = mysqli_query($conn, "UPDATE chatrooms SET status='1' WHERE id_chat=$id_chat");
		//	echo "<script>alert('Sesi sudah selesai!');document.location.href='../error-page/error_jam_sudah.html';</script>";
		//}
	} else { // BELUM DIMULAI
		$sql1 = mysqli_query($conn, "INSERT into chatrooms (id_session, status, port) VALUES ($id_session, 0, ".$list_port[$id_session-1].")");
		echo "<script>alert('Enter Chatroom!');document.location.href='../admin/admin_chatroom.php?id_session=".$id_chat."';</script>";
	}
?>

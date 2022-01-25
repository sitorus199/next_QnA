<?php 
function mycrypt($action, $data){
	$secret_key="lumintulogic1818";
	$secret_iv="3401402012810001";

	$key = hash("sha256", $secret_key);
	$iv = substr(hash("sha256", $secret_iv), 0, 16);
	switch($action){
		case "encrypt":
			return openssl_encrypt($data, "aes-128-cbc", $key, 0, $iv);
			break;
		case "decrypt":
			return openssl_decrypt($data, "aes-128-cbc", $key, 0, $iv);
			break;
	}
}
?>
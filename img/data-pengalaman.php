<?php 
    $url="http://localhost:8055/items/pengalaman/";
     
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($curl);
    $hasil = json_decode($response, true);
    $panjangdata = $hasil["data"];
    echo implode(" ",$panjangdata);
    for ($x = 0; $x < sizeof($panjangdata)/2; $x++) {
        echo "<i class='fas fa-circle'><b style='font-size: 20px;'> " . $hasil["data"][$x]["jabatan"]. "</i></b>";
        echo "<i><h6 style='padding-left:20px;'>" . $hasil["data"][$x]["durasi"]. "</i></h6>";
        echo "<p> - " .$hasil["data"][$x]["keterangan1"]. "";
        echo "<br> - " .$hasil["data"][$x]["keterangan2"]. "";
        echo "<br> - " .$hasil["data"][$x]["keterangan3"]. "</p>";
    }
    curl_close($curl);
?>
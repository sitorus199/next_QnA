<html>
   <head>
      <title>Kode Hash</title>
   </head>
   <body>
   
      <form action = "cek_user.php" method = "POST">
         id peserta: <input type = "text" name = "id_participant" />
         id tiket: <input type = "text" name = "id_ticket" />
         id sesi: <input type = "text" name = "id_session" />
         <br>
         kode md5: <input type = "text" name = "kode" />
         <input type = "submit" />
      </form>
      
      <?php
      include("crypt.php");
      $hasilHash = mycrypt("encrypt", "id_customer=1&id_ticket=1&id_session=1");
      $hasilDe = mycrypt("decrypt", $hasilHash);
      echo "[sudah checkpoint] Enkripsi dari id_customer=209&id_ticket=1&id_session=1 jadinya :". mycrypt("encrypt", "id_customer=209&id_ticket=1&id_session=1");
      //echo "<br>";
      //echo "di decrypt ulang jadi ". mycrypt("decrypt", "r2PyTxJB8jqNTSO+2xPBjDuyldVOhQflxqaMi+7fICOOFWNzXpdH6rfHD4cQH131");

      echo "<br>";
      echo "[sudah checkpoint] Enkripsi dari id_customer=212&id_ticket=1&id_session=2 jadinya :". mycrypt("encrypt", "id_customer=212&id_ticket=1&id_session=2");
      //echo "<br>";
      //echo "di decrypt ulang jadi ". mycrypt("decrypt", "fA4Bn9+Wnao1xbX4cMjcK+j+xouRygWXyCASOnf1RU8ru3U+dn5ZnneqXz1mmKLS");


      echo "<br>";
      echo "[belum checkpoint] Enkripsi dari id_customer=212&id_ticket=1&id_session=1 jadinya :". mycrypt("encrypt", "id_customer=212&id_ticket=1&id_session=1"); 
      echo "<br>";
      echo "di decrypt ulang jadi ". mycrypt("decrypt", "RvhLqF2Qu/nWtmYe6PtJVzQuBK3Sz2mrFa3wOgm9Wwquk6ErUmr5phiPlGIUIA8a");


      echo "<br>";
      echo "[Tidak ada peserta, 404 not found] Enkripsi dari id_customer=3&id_ticket=1&id_session=1 jadinya :". mycrypt("encrypt", "id_customer=3&id_ticket=1&id_session=1"); 
      echo "<br>";
      echo "di decrypt ulang jadi ".mycrypt("decrypt", "nJRJVHkepsUWtsPhyeVD7+EYuJX8DmKVpSalReYxRQMrzCA6AYb9uFosfeCZNw8Q");


      echo "<br>";
      echo "[beda sesi] Enkripsi dari id_customer=10&id_ticket=1&id_session=2 jadinya :". mycrypt("encrypt", "id_customer=10&id_ticket=1&id_session=2"); // beda sesi 
      echo "<br>";
      echo "di decrypt ulang jadi ".mycrypt("decrypt", "RvhLqF2Qu/nWtmYe6PtJVzQuBK3Sz2mrFa3wOgm9Wwquk6ErUmr5phiPlGIUIA8a");
      ?>
   </body></html>



# next_QnA
Project yang dikerjakan selama MBKM
Cara menjalankan otomatis cek port pada VPS denga script PHP
Koneksi
```Ruby
    $servername = "localhost";
	  $database = "qna_lumintu"; 
	  $username = "root";
	  $password = "";

	  // Create connection
	  $conn = mysqli_connect($servername, $username, $password, $database);

	  // Check connection
	  if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	  }
```

Cara menggunkan 

```Ruby
require('../database/connection.php');
$host = '23.100.16.66';
$ports = range(8000,9000);
foreach ($ports as $port) {
    $connection = @fsockopen($host, $port);
    if (is_resource($connection))
    {
        echo $host . ':' . $port . ' ' . '(' . getservbyport($port, 'tcp') . ') sudah digunakan.' . "\n";
        fclose($connection);
    }
    else
    {
        echo $host . ':' . $port . ' belum digunakan.' . "\n";
        echo $port;
        $checkdata = "UPDATE chats SET port = (SELECT $port FROM (SELECT 1)a WHERE NOT EXISTS (SELECT port FROM chats WHERE port = $port)) limit 1";

        $runQuery = mysqli_query($conn, $checkdata) or die(mysqli_error($conn));
        $numRow = $conn->affected_rows;
        
        if($numRow == 0){
            echo "\nport " . $port . ' ' . '(' .getservbyport($port, 'tcp') . ') sudah ada dalam database.' . "\n";
        }
        else{
            echo "\nPort berhasil ditambahkan\n";
            $conn->close();
            break;
        }
    }
}
```

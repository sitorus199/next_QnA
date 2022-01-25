<?php
session_start();

require(dirname(__FILE__). "/../database/ChatRooms.php");
include(dirname(__FILE__). "/../get_nama.php");
include(dirname(__FILE__). "/../database/connection.php");

if (!isset($_SESSION['is_login'])) {
   echo "<script>document.location.href='index.php';</script>";
   die();
}
$sql = "SELECT port FROM chatrooms WHERE id_session=".$_GET["id_session"];
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$portnya = $row["port"];
echo exec("php ../bin/server.php $portnya > /dev/null 2>&1 &");

$chat_object = new ChatRooms;

$chat_data = $chat_object->get_all_chat_data();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin QnA</title>

    <!-- Script API -->
    <script src="../api.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
    <!-- Custom styles for this template -->
    <link href="../style.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">

    <!-- Core plugin JavaScript-->
    <script src="../vendor-front/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript" src="../vendor-front/parsley/dist/parsley.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="http://parsleyjs.org/dist/parsley.js"></script>
             
</head>
<body>
    <div class="container py-4 text-white">
        <div class="d-flex justify-content-between mb-4">
            <div class="d-flex justify-content-start align-items-center">
                <img src="../assets/Logo QnA.svg" class="img-fluid text-center py-3" width="14%" alt="...">
                <h2 class="align-middle fw-bold mb-0 ps-3 text-white">Dashboard</h2>
            </div>
            <div class="align-items-center text-end pt-4">
                <p id="event-name" class="fw-bold mb-0" style="font-size: 1.6rem;"></p>
                <h6 class="fst-italic mt-0 mb-1">Lumintu Event</h6>
                <h6 id="date-time" class="mb-0"></h6>
            </div>
        </div>

        <div class="d-flex justify-content-between mb-4">
          <div class="d-flex justify-content-start align-items-center">
            <a class="btn btn-outline-light border-0 rounded my-0 p-0" style="background-color: transparent;" role="button" href="dashboard_admin.php" onclick="return confirm('Apakah anda yakin ingin keluar ?')">
              <i class="bi bi-arrow-left-square" style="font-size: 40px;"></i>
            </a>
          </div>
          <div class="align-items-center text-end pt-4">
            <a class="btn btn-outline-light border-2" role="button" href="logout.php" onclick="return confirm('Apakah anda yakin ingin keluar ?')">Logout</a>
          </div>
      </div>
        
        <div class="row pt-3" >
          <div class="col-6">
            <div class="d-flex justify-content-between align-items-center">
              <h5 class="fw-bold">Daftar Pertanyaan</h5>
              <h6 id="jumlah-pertanyaan"></h6>
            </div>
            <div class="input-group mb-3">
              <input type="text" id="search-accordion" class="form-control border-0 py-2 px-3 rounded-start" placeholder="Cari pertanyaan..." aria-label="Cari pertanyaan..." aria-describedby="search-addon" style="background-color: white; border-radius: .5rem 0 0 .5rem;"> 
              <button class="input-group-text py-2 border-0 rounded-end" id="search-addon" style="background-color: white; ">
                <i class="bi bi-search"></i>
              </button>
              <button class="input-group-text py-2 border-0 rounded ms-3"  id="filter-btn" style="background-color: white; ">
                <i class="bi bi-sort-alpha-down"style="font-size: 20px;"></i>
              </button>
            </div>

            <!-- <div class="card border-0 shadow-lg text-black"> -->
              <div class="accordion accordion-flush shadow-lg text-black rounded" id="accordionFlushExample" style="max-height: 560px; overflow-y: auto;">
                <?php
                foreach($chat_data as $chat)
                {
                    $str1 = str_split($chat["waktu_pengiriman"], 10);
                    $jam_pesan = str_split($str1[1], 6);
                    if ($chat["id_chat"] == $_GET["id_session"] && $chat["status"]==0){
                        $nama_peserta = get_nama($chat["id_pengirim"]);
                        $id = $chat["id_message"];
                        echo '<div class="accordion-item rounded" id="accordion-item-'.$chat["id_message"].'">
                      <h3 class="accordion-header" id="heading-'.$chat["id_message"].'">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-'.$chat["id_message"].'"" aria-expanded="false" aria-controls="flush-'.$chat["id_message"].'"">
                          <div class="align-items-center " style="width: 90%!important;">
                            <span class="fw-bold mb-2">'.$nama_peserta.'</span>
                            <div class="small text-truncate mt-2">'.$chat["pesan"].'</div>
                          </div>
                        </button>
                      </h3>
                      <div id="flush-'.$chat["id_message"].'" class="accordion-collapse collapse" aria-labelledby="heading-'.$chat["id_message"].'"" data-bs-parent="#accordionFlush">
                        <div class="accordion-body">
                          <p>'.$chat["pesan"].'</p>
                          <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-outline-primary btn-choose">Pilih</button>
                          </div>
                        </div>
                      </div>
                    </div>';
                    } 
                }
                ?>
              </div>
          </div>

          <div class="col-6">
            <div class="d-flex justify-content-between align-items-center">
              <h5 class="fw-bold">Daftar Pertanyaan Terpilih</h5>
              <h6 id="jumlah-pertanyaan-terpilih"></h6>
            </div>
            <div class="input-group mb-3">
              <input type="text" id="search-accordion-choose" class="form-control border-0 py-2 px-3 rounded-start" placeholder="Cari pertanyaan..." aria-label="Cari pertanyaan..." aria-describedby="search-addon" style="background-color: white; border-radius: .5rem 0 0 .5rem;"> 
              <button class="input-group-text py-2 border-0 rounded-end" id="search-addon" style="background-color: white; ">
                <i class="bi bi-search"></i>
              </button>
              <button class="input-group-text py-2 border-0 rounded ms-3"  id="filter-btn" style="background-color: white; ">
                <i class="bi bi-sort-alpha-down"style="font-size: 20px;"></i>
              </button>
            </div>

            <!-- <div class="card border-0 shadow-lg text-black"> -->
              <div class="accordion accordion-flush shadow-lg text-black rounded-top" id="accordionFlush-choose" >
                <?php
                foreach($chat_data as $chat)
                {
                    $str1 = str_split($chat["waktu_pengiriman"], 10);
                    $jam_pesan = str_split($str1[1], 6);
                    if ($chat["id_chat"] == $_GET["id_session"] && $chat["status"]==1){
                        $nama_peserta = get_nama($chat["id_pengirim"]);
                        $id = $chat["id_message"];
                        echo '<div class="accordion-item rounded" id="accordion-item-'.$chat["id_message"].'">
                      <h3 class="accordion-header" id="heading-'.$chat["id_message"].'">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-'.$chat["id_message"].'"" aria-expanded="false" aria-controls="flush-'.$chat["id_message"].'"">
                          <div class="align-items-center " style="width: 90%!important;">
                            <span class="fw-bold mb-2">'.$nama_peserta.'</span>
                            <div class="small text-truncate mt-2">'.$chat["pesan"].'</div>
                          </div>
                        </button>
                      </h3>
                      <div id="flush-'.$chat["id_message"].'" class="accordion-collapse collapse" aria-labelledby="heading-'.$chat["id_message"].'"" data-bs-parent="#accordionFlush">
                        <div class="accordion-body">
                          <p>'.$chat["pesan"].'</p>
                          <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-outline-danger d-block btn-delete">Hapus</button>
                            <button type="submit" class="btn btn-outline-success d-block btn-done">Selesai Jawab</button>
                          </div>
                        </div>
                      </div>
                    </div>';
                  }
                }
                ?>
              </div>
          </div>
        </div>

        <div class="row pt-5">
          <div class="col-6">
            <div class="d-flex justify-content-between align-items-center">
              <h5 class="fw-bold">Daftar Pertanyaan Terjawab</h5>
              <h6 id="jumlah-pertanyaan-terjawab"></h6>
            </div>
            <div class="input-group mb-3">
              <input type="text" id="search-accordion-answered" class="form-control border-0 py-2 px-3 rounded-start" placeholder="Cari pertanyaan..." aria-label="Cari pertanyaan..." aria-describedby="search-addon" style="background-color: white; border-radius: .5rem 0 0 .5rem;"> 
              <button class="input-group-text py-2 border-0 rounded-end" id="search-addon" style="background-color: white; ">
                <i class="bi bi-search"></i>
              </button>
              <button class="input-group-text py-2 border-0 rounded ms-3"  id="filter-btn" style="background-color: white; ">
                <i class="bi bi-sort-alpha-down"style="font-size: 20px;"></i>
              </button>
            </div>

            <div class="accordion accordion-flush shadow-lg text-black rounded-top" id="accordionFlush-answered" >
              <?php
                foreach($chat_data as $chat)
                {
                    $str1 = str_split($chat["waktu_pengiriman"], 10);
                    $jam_pesan = str_split($str1[1], 6);
                    if ($chat["id_chat"] == $_GET["id_session"] && $chat["status"]==2){
                        $nama_peserta = get_nama($chat["id_pengirim"]);
                        $id = $chat["id_message"];
                        echo '<div class="accordion-item rounded" id="accordion-item-'.$chat["id_message"].'">
                      <h3 class="accordion-header" id="heading-'.$chat["id_message"].'">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-'.$chat["id_message"].'"" aria-expanded="false" aria-controls="flush-'.$chat["id_message"].'"">
                          <div class="align-items-center " style="width: 90%!important;">
                            <span class="fw-bold mb-2">'.$nama_peserta.'</span>
                            <div class="small text-truncate mt-2">'.$chat["pesan"].'</div>
                          </div>
                        </button>
                      </h3>
                      <div id="flush-'.$chat["id_message"].'" class="accordion-collapse collapse" aria-labelledby="heading-'.$chat["id_message"].'"" data-bs-parent="#accordionFlush">
                        <div class="accordion-body">
                          <p>'.$chat["pesan"].'</p>
                        </div>
                      </div>
                    </div>';
            }
          }
          ?>

            </div>

          </div>
          <?php 
          echo "
          <input type='hidden' name='login_id_sesi' id='login_id_sesi' value='".$_GET["id_session"]."'/>;
	  <input type='hidden' name='port_id_client' id='port_id_client' value='".$portnya."'/>";
          ?>
            </div>
          </div>
      </div>
    <script>
        function escapeHtml(text) {
          return text
              .replace(/&/g, "&'';")
              .replace(/</g, "<'")
              .replace(/>/g, ">'")
              .replace(/"/g, "''")
              .replace(/'/g, "'");
        } 
        // Koneksi Websocket
        $(document).ready(function(){
	    var port_id = $('#port_id_client').val();
            var conn = new WebSocket('ws://20.127.6.96:'+port_id);
            conn.onopen = function(e) {
                console.log("Connection established!");
            };

            conn.onmessage = function(e) {
                console.log(e.data);

                var sesi_id1 = $('#login_id_sesi').val();
		//var port_id = $('#port_id_client').val()
		console.log(port_id)

                var data1 = JSON.parse(e.data);

                $.ajax({  
                    url: 'https://api-ticket.arisukarno.xyz/items/customer?fields=customer_id,customer_name&filter[customer_id]='+data1.userId,  
                    type: 'GET',  
                    //Authorization Header
                   // beforeSend: function (xhr) {
                     //   xhr.setRequestHeader('Authorization', 'Bearer tokencoba');
                    //},
                    dataType: 'json',  
                    success: function(data, textStatus, xhr) { 
                      var list_data = ''

                      var nama = data.data[0].customer_name 
		      //console.log('masuk sini?');
		      //var nama = "Arafat Maku";
                      //if( data1.sesiId == sesi_id1 )
                      //{
                         list_data += '<div class="accordion-item rounded-top" id="accordion-item-'+data1.mId+'"><h3 class="accordion-header" id="heading-'+data1.mId+'"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-'+data1.mId+'a'+'"" aria-expanded="false" aria-controls="flush-'+data1.mId+'a'+'""><div class="align-items-center " style="width: 90%!important;"><span class="fw-bold mb-2">'+nama+'</span><div class="small text-truncate mt-2">'+escapeHtml(data1.msg)+'</div></div></button></h3><div id="flush-'+data1.mId+'a'+'" class="accordion-collapse collapse" aria-labelledby="heading-'+data1.mId+'a'+'"" data-bs-parent="#accordionFlush"><div class="accordion-body"><p>'+data1.msg+'</p><div class="d-grid gap-2"><button type="button" class="btn btn-outline-primary btn-choose">Pilih</button></div></div></div></div>'
                      //}

                      $('#accordionFlushExample').append(list_data);
                    }
                })  
            };

        });
          
        </script>
    
    <script>
      //dapet data dari url untuk dapet ID tiketnya
      var id_tiket = 1;
      var id_tiket_session = 1;
        $.ajax({  
            url: 'https://api-ticket.arisukarno.xyz/items/ticket?fields=ticket_id,ticket_type,ticket_x_session.session_id.*,ticket_x_day.day_id.*',  
            type: 'GET',  
            dataType: 'json',  
            success: function(data, textStatus, xhr) { 
                // data.data.map(item => {
                    let nama = data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.session_desc
                    let time_start = new Date(data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.start_time)
                    let time_finish = new Date(data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.finish_time)
                   
                    let day = moment(time_start).format('dddd')
                    let time_begin = moment(time_start).format('HH:mm')
                    let time_end = moment(time_finish).format('HH:mm')
                    let date = moment(time_start).format('LL') 

                    $('#event-name').text(nama)
                    $('#date-time').text(day+", "+date+" | "+time_begin+" - "+time_end+" WIB")
                    // $('#time').text(time_begin+" - "+time_end)

                // }) 
            },
            error: function(xhr, textStatus, errorThrown) {  
                console.log('Error in Database');  
            }
        })

        //search accordion question pool
        $("#search-accordion").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            
            $("#accordionFlushExample .accordion-item").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
            counter()
        });

        //search accordion selected question pool
        $("#search-accordion-choose").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            
            $("#accordionFlush-choose .accordion-item").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
            counter()
        });
        
        //search accordion answered question pool
        $("#search-accordion-answered").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            
            $("#accordionFlush-answered .accordion-item").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
            counter()
        });

        // $(document).on("click", "#update_data", function() {
          
        // });

        //fungsi pindah accordion ke section terpilih
        $("body").on("click", '.btn-choose', function() {
          var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id');
          var id_numb = id_accordion_header.split("-");
          var idm = id_numb[1]
          console.log(idm)

          $.ajax({
            url: "../update.php",
            type: "POST",
            cache: false,
            data:{
              status: '1',
              id_message: idm,
            },
            success: function(dataResult){
              var dataResult = JSON.parse(dataResult);
              if(dataResult.statusCode==200){
                console.log('Data updated successfully ! '+idm+' apa');         
              }
            }
          });
          var cust_name = $(this).parent().parent().parent().siblings().children().children().children('span').text()
          var cust_message = escapeHtml($(this).parent().parent().parent().siblings().children().children().children('div').text())
          var parent_element = $(this).parent().parent().parent().parent().attr('id')

          // //get id accordion header number
          // var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id')
          // var id_numb = id_accordion_header.split("-")

          //get customer id number
          var id_customer = $(this).parent().parent().parent().siblings().children().children()

          var id_accordion = $(this).parent().parent().parent().attr('id')
          
          console.log("mau pindah")
          let elements=`<div class="accordion-item rounded" id="${parent_element}">
                          <h3 class="accordion-header" id="heading-${id_numb[1]}-choose">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${id_numb[1]}-choose" aria-expanded="false" aria-controls="flush-${id_numb[1]}-choose">
                              <div class="align-items-center " style="width: 90%!important;">
                                <span id="${id_numb[1]}" class="fw-bold mb-2">${cust_name}</span>
                                <div class="small text-truncate mt-2">${cust_message}</div>
                                </div>
                            </button>
                          </h3>
                          <div id="flush-${id_numb[1]}-choose" class="accordion-collapse collapse" aria-labelledby="heading-${id_numb[1]}-choose" data-bs-parent="#accordionFlush-choose">
                            <div class="accordion-body">
                              <p>${cust_message}</p>
                              <div class="d-grid gap-2">
                                <input type="hidden" id="isi_pesan1" value="${id_numb[1]}"/>
                                <button type="button" id="btn-delete" class="btn btn-outline-danger d-block btn-delete">Hapus</button>
                                <button type="button" class="btn btn-outline-success d-block btn-done">Selesai Jawab</button>
                              </div>
                            </div>
                          </div>
                        </div>`

          console.log("udah pindah")
          $("#accordionFlush-choose").append(elements);
          $("#"+parent_element).remove()
          counter()
        })

        //fungsi pindah accordion ke section awal
        $("body").on("click", ".btn-delete", function() {
          var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id')
          var id_numb = id_accordion_header.split("-")
          var idm = id_numb[1]
          console.log(idm)

          $.ajax({
            url: "../update.php",
            type: "POST",
            cache: false,
            data:{
              status: '0',
              id_message: idm,
            },
            success: function(dataResult){
              var dataResult = JSON.parse(dataResult);
              if(dataResult.statusCode==200){
                console.log('Data updated successfully ! '+idm+' apa');             
              }
            }
          });

          var cust_name = $(this).parent().parent().parent().siblings().children().children().children('span').text()
          var cust_message = escapeHtml($(this).parent().parent().parent().siblings().children().children().children('div').text())
          var parent_element = $(this).parent().parent().parent().parent().attr('id')

          //get id accordion header number
          var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id')
          var id_numb = id_accordion_header.split("-")

          //get customer id number
          var id_customer = $(this).parent().parent().parent().siblings().children().children()

          var id_accordion = $(this).parent().parent().parent().attr('id')
          console.log("mau pindah")
          
          $("#"+parent_element).remove()
          let elements=`<div class="accordion-item rounded" id="${parent_element}">
                          <h3 class="accordion-header" id="heading-${id_numb[1]}">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${id_numb[1]}" aria-expanded="false" aria-controls="flush-${id_numb[1]}">
                              <div class="align-items-center " style="width: 90%!important;">
                                <span class="fw-bold mb-2" id="${id_customer}">${cust_name}</span>
                                <div class="small text-truncate mt-2">${cust_message}</div>
                              </div>
                            </button>
                          </h3>
                          <div id="flush-${id_numb[1]}" class="accordion-collapse collapse" aria-labelledby="heading-${id_numb[1]}" data-bs-parent="#accordionFlush">
                            <div class="accordion-body">
                              <p>${cust_message}</p>
                              <div class="d-grid gap-2">
                                <input type="hidden" id="isi_pesan" value="${id_numb[1]}"/>
                                <button type="button" class="btn btn-outline-primary btn-choose">Pilih</button>
                              </div>
                            </div>
                          </div>
                        </div>`

          console.log("udah pindah")
          $("#accordionFlushExample").append(elements);
          counter()
        })

        //fungsi pindah accordion ke section terjawab
        $("body").on("click", ".btn-done", function() {
          var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id')
          var id_numb = id_accordion_header.split("-")
          var idm = id_numb[1]
          console.log(idm)

          $.ajax({
            url: "../update.php",
            type: "POST",
            cache: false,
            data:{
              status: '2',
              id_message: idm,
            },
            success: function(dataResult){
              var dataResult = JSON.parse(dataResult);
              if(dataResult.statusCode==200){
                console.log('Data updated successfully ! '+idm+' apa');          
              }
            }
          });
          var cust_name = $(this).parent().parent().parent().siblings().children().children().children('span').text()
          var cust_message = escapeHtml($(this).parent().parent().parent().siblings().children().children().children('div').text())
          var parent_element = $(this).parent().parent().parent().parent().attr('id')

          // //get id accordion header number
          // var id_accordion_header = $(this).parent().parent().parent().siblings().attr('id')
          // var id_numb = id_accordion_header.split("-")

          //get customer id number
          var id_customer = $(this).parent().parent().parent().siblings().children().children()

          var id_accordion = $(this).parent().parent().parent().attr('id')
          console.log(parent_element)
          
          $("#"+parent_element).remove()
          let elements=`<div class="accordion-item rounded" id="${parent_element}">
                          <h3 class="accordion-header" id="heading-${id_numb[1]}-answered">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${id_numb[1]}-answered" aria-expanded="false" aria-controls="flush-${id_numb[1]}-answered">
                              <div class="align-items-center " style="width: 90%!important;">
                                <span id="${id_numb[1]}" class="fw-bold mb-2">${cust_name}</span>
                                <div class="small text-truncate mt-2">${cust_message}</div>
                                </div>
                            </button>
                            </h3>
                          <div id="flush-${id_numb[1]}-answered" class="accordion-collapse collapse" aria-labelledby="heading-${id_numb[1]}-answered" data-bs-parent="#accordionFlush-answered">
                            <div class="accordion-body">
                              <p>${cust_message}</p>
                            </div>
                          </div>
                        </div>`

          $("#accordionFlush-answered").append(elements);
          counter()
        })

        function SortByName(a, b){
          var aName = a.name.toLowerCase();
          var bName = b.name.toLowerCase(); 
          return (
            (aName < bName) ? -1 : ((aName > bName) ? 1 : 0)
            );
        }
        
        //button filter to sort accordion
        // $("body").on("click", '#filter-btn', function(){
  
        //   console.log("length: "+arr_all.length)
        //   console.log(arr_all[arr_all.length-1])
        //   arr_all.sort(SortByName)
          
        //   if(status_sort === 0){
        //     status_sort = 1
            
        //     for (var i = 0; i < arr_all.length; i++) {
              
        //       let elements=`<div class="accordion-item rounded" id="accordion-item-${i+1}">
        //                       <h3 class="accordion-header" id="heading-${i+1}">
        //                         <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${i+1}" aria-expanded="false" aria-controls="flush-${i+1}">
        //                           <div class="align-items-center " style="width: 90%!important;">
        //                             <span id="customer-${i+1}" class="fw-bold mb-2">${arr_all[i].name}</span>
        //                             <div class="small text-truncate mt-2">${i+1} Earnest greater on no observe fortune norland. Hunted mrs ham wishes stairs. Continued he as so breakfast shameless. All men drew its post knew. Of talking of calling however civilly wishing resolve.</div>
        //                           </div>
        //                         </button>
        //                       </h3>
        //                       <div id="flush-${i+1}" class="accordion-collapse collapse" aria-labelledby="heading-${i+1}" data-bs-parent="#accordionFlush">
        //                         <div class="accordion-body">
        //                           <p>Earnest greater on ${i+1} no observe fortune norland. Hunted mrs ham wishes stairs. Continued he as so breakfast shameless. All men drew its post knew. Of talking of calling however civilly wishing resolve.</p>
        //                           <div class="d-grid gap-2">
        //                             <button type="button" data-array-index="${i+1}" class="btn btn-outline-primary btn-choose">Pilih</button>
        //                           </div>
        //                         </div>
        //                       </div>
        //                     </div>`
              
        //       // console.log(arr)
        //       console.log(i + arr_all[i].name)
        //       $("#accordionFlushExample #accordion-item-"+(i+1)).remove()
        //       $(elements).appendTo("#accordionFlushExample");
              
        //     }

        //   }   

          

        // })
        
        counter();

        function counter() {
          $('#jumlah-pertanyaan').text("Jumlah : " + $('#accordionFlushExample .accordion-item').length)
          $('#jumlah-pertanyaan-terpilih').text("Jumlah : " +$('#accordionFlush-choose .accordion-item').length)
          $('#jumlah-pertanyaan-terjawab').text("Jumlah : " +$('#accordionFlush-answered .accordion-item').length)

        }
        

        
    </script>
    <script src="../chat.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <!-- moment Js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>
    <script>
      moment.locale('id');
      console.log(moment(Date.now()).fromNow());
    </script>

  </body>
</html>

<?php

require('database/ChatRooms.php');
include("crypt.php");
include("get_nama.php");
include("database/connection.php");

$chat_object = new ChatRooms;

$chat_data = $chat_object->get_all_chat_data();

$uri_path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_QUERY);
// $uri_segments = explode('/', $uri_path);
$hasilHash = mycrypt("decrypt", $uri_path);
$arrayHasil = explode("&", $hasilHash);
$peserta_id = explode("=",$arrayHasil[0]);
$ticket_id = explode("=",$arrayHasil[1]);
$sesi_id = explode("=",$arrayHasil[2]);

$nama_peserta = get_nama($peserta_id[1]);
$sql = "SELECT port FROM chatrooms WHERE id_session=".$sesi_id[1];
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$portnya = $row["port"];
?> 

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User QnA</title>

    <script src="api.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    
    <script src="vendor-front/jquery/jquery.min.js"></script>
    <script src="vendor-front/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor-front/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript" src="vendor-front/parsley/dist/parsley.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="http://parsleyjs.org/dist/parsley.js"></script>

    <!-- Custom styles for this template -->
    <link href="css-js/qna/style.css" rel="stylesheet">
    
</head>
<body>
    <div class="container-lg px-sm-0 px-md-4 py-md-4 pt-lg-4 pt-xl-4 pt-xxl-4">
        <div class="card border-0 shadow-lg" style="border-radius: .75rem 0 0 .75rem; width: 100%;height: 100%;">
            <div id="card-content-full" class="row g-0">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <img src="assets/bg-group2.png" class="" alt="..." height="560px" style="border-radius: .75rem 0 0 .75rem;object-fit: fill;">
                    <div class="card-img-overlay p-0 text-white px-5 pt-4" style="width: 34%;">
                        <div class="d-flex justify-content-start align-items-center">
                            <img src="assets/Logo QnA.svg" class="img-fluid text-center py-3" width="20%" alt="...">
                            <h2 class="align-middle fw-bold mb-0 ps-3 text-white">QnA</h2>
                        </div>
                        <h1 class="fw-bold text-white mt-5">Hello,</h1>
                        <?php echo '<h1 class="text-white mb-5" id="customer-name">'. $nama_peserta.'</h1>'; ?>
                        <p id="nama_sesi" class="card-text fw-bold mb-0 mt-4" style="font-size: 1.6rem;">Webinar Pengenalan Diri</p>
                        <p class="card-text mt-1">Lumintu Event</p>
                        <p id="date" class="card-text fw-bold mb-0 mt-4" ></p>
                        <p id="time" class="card-text mt-1"></p>
                    </div>
                </div>

                <!-- Chat Elements -->
                <div class="col-8">
                    <div class="card border-0" style="height: 560px;">
                        
                        <div class="card-header py-4 px-4 border-0 " style="background-color: #ffffff;">
                            <div class="row justify-content-center">
                                <div class="col-1 align-content-center">           
                                    <img class="rounded-circle text-center" src="/lumintu_qna/assets/Logo Lumintu.svg" alt="" width="50px">
                                </div>
                                <div class="col-11">
                                    <div class="row">
                                        <div class="col-12">
                                            <span class="fw-bold" style="font-size: 1.2rem;">Administrator</span>
                                        </div>
                                        <div class="col-12">
                                            <span class="" style="font-size: .9rem;">Online</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="conversation" class="card-body" style="overflow-x: hidden; overflow-y: auto; background-color: #EBECEF;">
                            <div class="row g-0" id="messages_area">
                                <?php
                                foreach($chat_data as $chat)
                                {
                                    $str1 = str_split($chat["waktu_pengiriman"], 10);
                                    $jam_pesan = str_split($str1[1], 6);
                                    // if id_participant = $chat["id_pengirim"] then 
                                    // $abc = base64_decode($_GET["id_participant"]);
                                    if ($chat["id_pengirim"] == $peserta_id[1] &&$chat["id_chat"] == $sesi_id[1]){
                                        echo '
                                        <div class="col-12 mb-3">
                                            <span class="px-3 pt-2 pb-4 chat-bubble float-end text-white position-relative" style="background-color: #38435F; min-width: 10%; max-width: 70%; border-radius: .5rem!important;">'.$chat["pesan"].'<span class="text-white-50 position-absolute bottom-0 end-0 me-2 mb-1" style="font-size: .8rem;">
                                                    '.$jam_pesan[0].'
                                                </span>
                                            </span>
                                        </div> ';
                                    }
                                }
                                ?>
                                <!-- <div class="col-12 mb-3">
                                    <span class="px-3 pt-2 pb-4 chat-bubble float-start position-relative" 
                                    style="background-color: #FFFFFF ;min-width: 10%; max-width: 70%; border-radius: .5rem!important;"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea /at. 
                                        <span class="text-black-50 position-absolute bottom-0 end-0 me-2 mb-1" style="font-size: .8rem;">
                                            7.30 PM
                                        </span>
                                    </span>
                                </div> -->
                            </div>
                        </div>

                        <div id="conversation-footer" class="border-0 px-3 py-3" style="border-radius: 0 0 .75rem 0; background-color: #FFFFFF;">
                            <!-- conversation -->
                            <form method="post" id="chat_form" data-parsley-errors-container="#validation_error">
                                <div class="row">
                                    <div class="col-11 pe-3">
                                        <textarea class="chat-text-area form-control border-0 me-3" 
                                        id="chat_message" name="chat_message"
                                        rows="1" placeholder="Tulis pesan Anda..."
                                        style="background-color:#FFFFFF" required></textarea>
                                    </div>
                                    <div class="col-1 text-center">
                                        <div id="timer" style="display:none;"></div>
                                        <button type="submit" name="send" id="send" class="btn btn-send p-1"  >
                                            <img src="/lumintu_qna/assets/btnSend.svg">
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <?php 
                              echo "
                            <input type='hidden' name='login_user_id' id='login_user_id' value='".$peserta_id[1]."'/>
                            <input type='hidden' name='login_id_sesi' id='login_id_sesi' value='".$sesi_id[1]."'/>
                            <input type='hidden' name='login_id_ticket' id='login_id_ticket' value='".$ticket_id[1]."'/>
                            <input type='hidden' name='port_id' id='port_id' value='".$portnya."'/>"
			    ?>
                        </div>

                    </div>
                </div>
            </div>
          </div>
    </div>

    <!-- moment Js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>
    <script>
      moment.locale('id');
      console.log(moment(Date.now()).fromNow());
    </script>
    <script type="text/javascript"> 
            $(document).ready(function(){
                $("#send").click(function(){
                    $("#send").hide();
                    $("#timer").show();
                });
            });
            
            $(document).ready(function(){
                $("#send").click(function(){
                    var detik = 6;
                    //var pesann = '<img src="../lumintu_qna/assets/btnSend.svg">';
                    var pesann = 'wait';
                    function hitung(){
                        var to = setTimeout(hitung,1000);
                        var peringatan ='style = "color: red"';
                        $('#timer').html('<p align="center" '+peringatan+'>'+pesann+'</p>');

                        detik--;
                        if(detik<0){
                            clearTimeout(to);
                            detik = 10;
                            $("#timer").hide();
                            $("#send").show();
                        }
                    }
                    hitung();
                });
            });
        </script>
    <script > 
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
	    var portid = $('#port_id').val();
            var conn = new WebSocket('ws://20.127.6.96:'+portid);
            conn.onopen = function(e) {
                console.log("Connection established!");
            };

            conn.onmessage = function(e) {
                console.log(e.data);

                var data = JSON.parse(e.data);

                var row_class = '';

                var background_class = '';

                var html_data = '';

                var msg1= escapeHtml(data.msg);

                if(data.from == 'Me')
                {
                    row_class = 'float-end text-white ';
                    bg = ' #38435F';
                    text= 'text-white-50';
                    time='text-white-50'
                    background_class = 'alert-info';

                    html_data = "<div class='col-12 mb-3'><span class='px-3 pt-2 pb-4 chat-bubble "+row_class+"  position-relative' style='background-color: "+bg+" ; min-width: 10%; max-width: 70%; border-radius: .5rem!important;'>"+msg1+"<span class='"+time+" position-absolute bottom-0 end-0 me-2 mb-1' style='font-size: .8rem;'>"+moment().format('LT')+"</span> </span></div>"

                }

                $('#messages_area').append(html_data);

                $("#chat_message").val("");
            };

            // Proses Pengiriman Pesan

            $('#messages_area').scrollTop($('#messages_area')[0].scrollHeight);

            $('#chat_form').on('submit', function(event){

                event.preventDefault();

                if($('#chat_form').parsley().isValid())
                {

                    var user_id = $('#login_user_id').val();

                    var message_id = ''

                    var id_sesi = $('#login_id_sesi').val();

                    var message = $('#chat_message').val();

                    var data = {
                        userId : user_id,
                        mId : message_id,
                        msg : message,
                        sesiId : id_sesi
                    };
                    conn.send(JSON.stringify(data));

                    $('#messages_area').scrollTop($('#messages_area')[0].scrollHeight);

                }
            });

        });
          
        </script>
        <script>
        var id_tiket = $('#login_id_ticket').val();
        var id_tiket_session = $('#login_id_sesi').val();
        $.ajax({  
            url: 'https://api-ticket.arisukarno.xyz/items/ticket?fields=ticket_id,ticket_type,ticket_x_session.session_id.*,ticket_x_day.day_id.*',  
            type: 'GET',  
            dataType: 'json',  
            success: function(data, textStatus, xhr) { //callback - pengganti promise
                // data.data.map(item => {
                    console.log(data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.start_time)
                    let nama = data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.session_desc
                    let time_start = new Date(data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.start_time)
                    let time_finish = new Date(data.data[id_tiket-1].ticket_x_session[id_tiket_session-1].session_id.finish_time)
                   
                    let day = moment(time_start).format('dddd')
                    let time_begin = moment(time_start).format('HH:mm')
                    let time_end = moment(time_finish).format('HH:mm')
                    let date = moment(time_start).format('LL') 

                    // $('#24365    87').text(day+", "+date+" | "+time_begin+" - "+time_end+" WIB")

                    $('#nama_sesi').text(nama)
                    $('#date').text(day+", "+date)
                    $('#time').text(time_begin+" - "+time_end + " WIB")

                // }) 
            },
            error: function(xhr, textStatus, errorThrown) {  
                console.log('Error in Database');  
            }
        })
        </script>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    
</body>
</html>

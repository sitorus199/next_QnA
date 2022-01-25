<?php
require('database/ChatRooms.php');
include("get_nama.php");
include("cek_qchoosen.php");
$chat_object = new ChatRooms;

$chat_data = $chat_object->get_all_chat_data();
?>
<!DOCTYPE html>
<html lang="en">h

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Display QnA</title>

    <script src="api.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="vendor-front/jquery/jquery.min.js"></script>
    <script src="vendor-front/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor-front/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript" src="vendor-front/parsley/dist/parsley.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="http://parsleyjs.org/dist/parsley.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet">

</head>
<body style="background-color: #ffffff;">
    <!-- QnA  -->
    <div class="container pb-5">
        <div class="mx-auto">
            <div id="logo" 
            class="py-4 d-flex justify-content-center align-items-center"> 

                <img src="./assets/Logo QnA circle.svg" class="text-center" width="70px" alt="logoQnA" alt="">
                <p class="align-middle fw-bold ms-3 mb-0" style="color: #38435F; font-size: 1.9rem;">QnA</p>
           </div>                 
        </div>

        <div class="card border-0 shadow-lg" style="width: 100%;height: 100%;">

            <div class="card text white rounded-0 rounded-top" 
            style="background-color: #38435F; 
            width: 100%;
            height: 100%; 
            border: 0px;">

                <div class="text-center py-4">
                    <h4 id="nama_sesi" class="card-title text-white fw-bold"><b></b></h4>
                    <h6 class="card-text text-white">Lumintu Event</h6>
                    <h6 id="date" class="card-text text-white fw-bold"><b></b></h6>
                    <h6 id="time" class="card-text text-white"></h6>
                </div>
                    
            </div>


                <div class="card text white shadow-lg border-0 rounded-0 rounded-bottom p-5" 
                style="background-color: white; 
                width: 100%;">

                    <div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-interval="false" style="margin-top: auto; margin-bottom: auto;">
                        <div class="carousel-inner" id="qna_display">
                            <?php 
                            if ((cek_qchoosen($_GET["id_session"])) == "2"){
                                echo '<div class="carousel-item active">
                                    <div class="container  px-5" >
                                    <h3 class="card-title text-dark mx-3 px-5">
                                    Belum ada pertanyaan.
                                    </h3>
                                    <hr class=" mt-5 mx-5 ">
                                    <h3 class=" mx-3 px-5 fw-bold">silahkan menunggu</h3S>
                                </div>
                                </div>';
                            } else {
                                echo '<div class="carousel-item active">
                                    <div class="container  px-5" >
                                    <h3 class="card-title text-dark mx-3 px-5">
                                    Pertanyaan pertama ada di samping. 
                                    </h3>
                                    <hr class=" mt-5 mx-5 ">
                                    <h3 class=" mx-3 px-5 fw-bold">Silahkan digeser.</h3S>
                                    </div>
                                    </div>';
                                $panjang1 = sizeof($chat_data)-1;
                                for($x = 0; $x <= $panjang1; $x++){
                                    $nama_peserta1 = get_nama($chat_data[$x]["id_pengirim"]);
                                    if ($chat_data[$x]["id_chat"] == $_GET["id_session"] && $chat_data[$x]["status"]==1){
                                        echo '<div class="carousel-item">
                                        <div class="container  px-5" >
                                        <h3 class="card-title text-dark mx-3 px-5">
                                        '.$chat_data[$x]["pesan"].'
                                        </h3>
                                        <hr class=" mt-5 mx-5 ">
                                        <h3 class=" mx-3 px-5 fw-bold">'.$nama_peserta1.'</h3S>
                                        </div>
                                        </div>';
        
                                    }
                                    
                                }
                                
                            }
                        ?>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    </button>
                </div>                
                </div>
                
            </div>
        </div>
    </div>
    <?php 
      echo "
    <input type='hidden' name='login_id_sesi' id='login_id_sesi' value='".$_GET['id_session']."'/>";
    echo "
    <input type='hidden' name='login_id_ticket' id='login_id_ticket' value='".$_GET['id_session']."'/>";
    ?>
</body>          
    <script>
        var id_tiket = $('#login_id_ticket').val();
        var id_tiket_session = $('#login_id_sesi').val();
        $.ajax({  
            url: 'http://192.168.18.76:8001/items/ticket?fields=ticket_id,ticket_type,ticket_x_session.session_id.*,ticket_x_day.day_id.*&filter[ticket_id]='+id_tiket,  
            type: 'GET',  
            dataType: 'json',  
            success: function(data, textStatus, xhr) { //callback - pengganti promise
                // data.data.map(item => {
                    console.log(data.data[0].ticket_x_session[id_tiket_session-1].session_id.start_time)
                    let nama = data.data[0].ticket_x_session[id_tiket_session-1].session_id.session_desc
                    let time_start = new Date(data.data[0].ticket_x_session[id_tiket_session-1].session_id.start_time)
                    let time_finish = new Date(data.data[0].ticket_x_session[id_tiket_session-1].session_id.finish_time)
                   
                    let day = moment(time_start).format('dddd')
                    let time_begin = moment(time_start).format('HH:mm')
                    let time_end = moment(time_finish).format('HH:mm')
                    let date = moment(time_start).format('LL') 

                    // $('#2436587').text(day+", "+date+" | "+time_begin+" - "+time_end+" WIB")

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

    <script src="chat.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <!-- moment Js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>
    <script>
      moment.locale('id');
      console.log(moment(Date.now()).fromNow());
    </script>
</html>
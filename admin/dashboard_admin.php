<?php
session_start();

if (!isset($_SESSION['is_login'])) {
    echo "<script>document.location.href='index.php';</script>";
    die();
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin</title>

    <script src="../api.js"></script>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous"
    />

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet" />
  </head>
  <body>
    <!--<div class="container"></div>-->
    <div
      class="container shadow-lg"
      style="
        height: auto;
        width: auto;
        margin-bottom: 30px;
        margin-top: 30px;
        background-color: #38435f;
        position: relative;
        padding-bottom: 20px;
      "
    >
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 ps-4" style="padding-top: 30px;">
                <a class="btn btn-outline-light" role="button" href="logout.php" onclick="return confirm('Apakah anda yakin ingin keluar ?')">LOGOUT</a>
            </div>
            <div class="col-lg-8 col-md-6 col-sm-6 d-flex justify-content-center text-white" style="padding-top: 30px;">
                <img
                src="../assets/Logo QnA.svg"
                class="img-fluid"
                width="40px"
                alt="..."
                style="margin-right: 10px;"
                />
                <h3 class="fw-bold">Daftar Room QnA Event</h3> 
            </div>
            

            <div class="col-lg-2 col-md-2 col-sm-2" style="padding-top: 30px;">
                <img class="d-flex justify-content-end" src="../assets/logo_kraton.png" alt="" width="100" >
            </div>
        </div>

        <div class="container text-center">
            <div id="list_sesi" class="row mb-1 " style="margin-top:30px;">
            </div>
        </div>
    </div>
    <script>
        var id_tiket = 1;
        var id_tiket_session = 1;
        $.ajax({  
            url: 'https://api-ticket.arisukarno.xyz/items/ticket?fields=ticket_id,ticket_type,ticket_x_session.session_id.*&filter[ticket_id]=4',  
            type: 'GET',  
            dataType: 'json',  
            success: function(data, textStatus, xhr) { 
                
                let html_data = ""
                console.log(data.data)
                for(var i = 0; i < data.data.length; i++){
                    for(var j = 0; j < data.data[i].ticket_x_session.length; j++){
                        console.log(data.data[i].ticket_x_session[j].session_id.session_desc)
                        let nama_event = data.data[i].ticket_x_session[j].session_id.session_desc
                        let id_session = data.data[i].ticket_x_session[j].session_id.session_id
                        let time_start = new Date(data.data[i].ticket_x_session[j].session_id.start_time)
                        let time_finish = new Date(data.data[i].ticket_x_session[j].session_id.finish_time)
                        let day = moment(time_start).format('dddd')
                        let time_begin = moment(time_start).format('LT')
                        let time_end = moment(time_finish).format('LT')
                        let date = moment(time_start).format('LL')  
                        let button_chat = ""
                        let jam = 60 * 60 * 1000
                        let eventbenar = new Date(time_start - jam)
                        // jika waktu mulai masih blm lewat : beda sejam 
                        // 25/10/2021 16:11 <= 01/12/2021 09:00
                        if( new Date('2021-12-01T16:00:00') >= eventbenar ){
                            button_chat += "Segera dalam 1 Jam"
                        } else { // 
                            
                            // jika waktu mulai sudah lewat tapi waktu finish belum
                            if( new Date() < time_start && new Date() < time_finish) {
                                button_chat += "Segera";
                            } else if (new Date() > time_start && new Date() < time_finish) {
                                button_chat += "Berjalan"
                            } else { // jika waktu mulai dan waktu finish sudah lewat
                                button_chat += "Selesai"
                            }
                            // button_chat += "Beda"
                        }

                        html_data += '<div class="mb-4 col-lg-3 col-md-6 col-sm-12 card-group">' + 
                                        '<div class="card border-0" style="background-color:#ffffff;">' +
                                            '<img src="../assets/event1.jpg" class="card-img-top" alt="..." style="height: 140px; width=30px">' +
                                            '<div class="card-body text-center">' +
                                            '<h6 class="card-title fw-bold">' + nama_event + '</h6>' +
                                            '<p class="card-text"><small>' + day + ', ' + date + '<br>' + time_begin + ' - ' + time_end + '</small></p>' +
                                            '<div class="card-footer border-0" style="background-color:transparent"> '+
                                            '<a href="../database/RoomChats.php?id_session='+ id_session +'" class="btn btn-sm btn-primary">' + button_chat + '</a>' +
                                            '</div>' +
                                            '</div>'+
                                        '</div>' +
                                    '</div>';   
                    }
                }
                document.getElementById("list_sesi").innerHTML = html_data;
            },
            error: function(xhr, textStatus, errorThrown) {  
                console.log('Error in Database');  
            }
        })
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </body>
</html>

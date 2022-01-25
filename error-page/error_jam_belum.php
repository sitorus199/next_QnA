<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <title>404 Error Page | CodingNepal</title>
    <script src="../api.js"></script>
    <link rel="stylesheet" href="style1.css" />
    <link href="../fontawesome/css/all.css" rel="stylesheet">
  </head>
  <body>
    <div id="error-page">
      <div class="content">
        <i class="fas fa-exclamation-triangle fa-8x" style="margin: 50px; color: #38435f;"></i>
        <h4 data-text="Opps! Page not found">Opps Something Wrong!</h4>
        <p>
          Mohon maaf sesi QnA ini belum dimulai! <br>
          Harap akses kembali pada waktu yang seharusnya. Dapat dilihat pada tiket anda. <!-- <b id="date_time"></b>  -->
        </p>              
      </div>
    </div>

    <script>
        // var waktu = $('#waktu_mulai').val();
        // let day = moment(waktu).format('dddd')
        // let time_begin = moment(waktu).format('HH:mm')
        // let date = moment(waktu).format('LL') 

        // $('#date_time').text(day+", "+date+" jam "+time_begin+" WIB")
        // $.ajax({  
        //     url: 'http://192.168.18.226:8001/items/session?fields=session_id,start_time,finish_time&filter[session_id]=1',
        //     type: 'GET',  
        //     dataType: 'json',  
        //     success: function(data, textStatus, xhr) { //callback - pengganti promise
        //         // data.data.map(item => {
        //         let time_start = new Date(data.data[0].start_time)
               
        //         let day = moment(time_start).format('dddd')
        //         let time_begin = moment(time_start).format('HH:mm')
        //         let date = moment(time_start).format('LL') 

        //         $('#waktu_mulai').text(day+", "+date+" jam "+time_begin+" WIB")
        //     },
        //     error: function(xhr, textStatus, errorThrown) {  
        //         console.log('Error in Database');  
        //     }
        // })
        </script>
  </body>
</html>

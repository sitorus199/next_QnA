hideChat(0) 

$('.btn-send').click(function() {
    let nama=$('#formName').val()
    let email=$('#formEmail').val()

    console.log(nama)
    let elements=`<div class="col-12 mb-3">
            <span class="px-3 pt-2 pb-4 chat-bubble float-end text-white position-relative" style="background-color: #00A389; min-width: 20%; max-width: 80%; border-radius: 1rem!important;">
                  ${nama}
                  <span class="text-white-50 position-absolute bottom-0 end-0 me-2 mb-1" style="font-size: .8rem;">
                        ${email}
                  </span>
            </span>
      </div>`

    hideChat(1)
});

$('#btn-toggle-chat').click(function() {
    hideChat(0)
    // hideChat(2)
});

//Toggle chat and links
function toggleFab() {
    
}

function hideChat(hide) {
    switch (hide) {
      case 0:
            $('#form-nama').css('display', 'block');
            $('#conversation').css('display', 'none');
            $('#btn-form-name').css('display', 'block');
            $('#conversation-footer').css('display', 'none');
            break;
      case 1:
            $('#form-nama').css('display', 'none');
            $('#conversation').css('display', 'block');
            $('#btn-form-name').css('display', 'none');
            $('#conversation-footer').css('display', 'block');
            break;
      case 2:
            $('#btn-message').css('display', 'none');
            $('#btn-chevron').css('display', 'block');
            break;
      case 3:
            $('#btn-message').css('display', 'none');
            $('#btn-chevron').css('display', 'block');
            break;

    }
}

//chat send method
function sendChat() {
    event.preventDefault();
    let message=$('.chat-text-area').val() 
    console.log(message)
    let elements=`<div class="col-12 mb-3">
                    <span class="px-3 pt-2 pb-4 chat-bubble float-end text-white position-relative" style="background-color: #00A389; min-width: 20%; max-width: 80%; border-radius: 1rem!important;">
                          ${message}
                          <span class="text-white-50 position-absolute bottom-0 end-0 me-2 mb-1" style="font-size: .8rem;">
                                ${moment().format('LT')}
                          </span>
                    </span>
              </div>`
    $("#messages_area").append(elements);
    message = ''
    $("#chat_message").val('')

}


// // Get the input field
// var input = document.getElementsByClassName("chat-text-area");

// // Execute a function when the user releases a key on the keyboard
// input.addEventListener("keyup", function(event) {
//   // Number 13 is the "Enter" key on the keyboard
//   if (event.keyCode === 13) {
//     // Cancel the default action, if needed
//     event.preventDefault();
//     // Trigger the button element with a click
//     document.getElementsByClassName("btn-send").click();
//   }
// });

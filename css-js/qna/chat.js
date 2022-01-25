$(document).ready(function() {

      //chat send method
      $('.btn-send').click(function() {
            let message=$('.chat-text-area').val() 
            console.log(message)
            if(message !== '')
            {
                  let elements=`<div class="col-12 mb-3">
                              <span class="px-3 pt-2 pb-4 chat-bubble float-end text-white position-relative" style="background-color: #38435F; min-width: 10%; max-width: 70%; border-radius: .5rem!important;">
                                    ${message}
                                    <span class="text-white-50 position-absolute bottom-0 end-0 me-2 mb-1" style="font-size: .8rem;">
                                          ${moment().format('LT')}
                                    </span>
                              </span>
                        </div>`

                  $("#conversation-container").append(elements);
                  message = ''
                  $("#textbox-chat").val('')
            }
      })

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

      // $('#textbox-chat').keypress(function (e) {
      //       var key = e.which;
      //       if(key == 13)  // the enter key code
      //        {
      //          $('.btn.send').click();
      //          return false;  
      //        }
      // });

      $('#textbox-chat').keypress(function (e) {
            if (e.which == 13) {
                  // $(this).blur();
                  sendChat()
            }
            
            // $(this).focus();
            // $(this).val('')
            
      });

})
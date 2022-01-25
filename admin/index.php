<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Admin</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous"
    />
    </head>
    <body>
      <div
        class="container d-flex justify-content-center "
        style="height: 600px; margin-top:30px;"
      >
        <div class="card rounded shadow mx-auto" style="background-color: #38435F; width:420px; margin-bottom:auto; margin-top:auto;">
          <div class="card-body" style="margin-top:auto; margin-bottom:auto;">
              <div  style="text-align:right;">
                <img src="../assets/logo_kraton.png" style="height: 30px; width: 100px;">
              </div>
            <h2 class="card-title fw-bold text-center text-white" style="margin-top: 30px;">Login Admin</h2>
            <form action="login.php" method="post" class="needs-validation" novalidate>
              <div class="mb-3"style="margin-right: 2rem; margin-left: 2rem; margin-top: 2rem">
              <label for="exampleFormControlInput1" class="form-label username text-white"
                >Username
              </label>
              <input
                type="text"
                class="form-control"
                id="exampleFormControlInput1"
                name="user"
                placeholder="Masukan Username"
                required
              />
              <div class="invalid-feedback">
                Username harus terisi
              </div>
              </div>
              <div
              class="mb-3"
              style="margin-right: 2rem; margin-left: 2rem; margin-top: 0rem">
                <label for="exampleFormControlInput2" class="form-label email text-white"
                >Password
                </label>
                <input
                  type="password"
                  class="form-control"
                  id="exampleFormControlInput2"
                  name="pass"
                  placeholder="Masukan Password"
                  required
                />
                <div class="invalid-feedback">
                  Password harus terisi
                </div>
              </div>
              <div class="mb-3" style="margin-right: 2rem; margin-left: 2rem; margin-top: 2rem">
              <button
                  type="submit"
                  class="btn text-white text-center"
                  name="login"
                  style="
                    background-color: #d4af37;
                  width:100%;
                  "
                ><b>Login </b> 
              </button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
          'use strict'
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.querySelectorAll('.needs-validation')
          // Loop over them and prevent submission
          Array.prototype.slice.call(forms)
            .forEach(function (form) {
              form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                }
                form.classList.add('was-validated')
              }, false)
            })
        })()
      </script>
    </body>
  </html>
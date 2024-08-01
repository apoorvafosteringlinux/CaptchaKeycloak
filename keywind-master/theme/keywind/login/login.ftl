
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/styles.css">
</head>
<body>
    <div id="kc-login">
        <h1>Login</h1>
        <form id="kc-form-login" action="${url.loginAction}" method="post">
            <div>
                <label for="username">${msg("username")}</label>
                <input type="text" id="username" name="username" autofocus autocomplete="off">
            </div>
            <div>
                <label for="password">${msg("password")}</label>
                <input type="password" id="password" name="password" autocomplete="off">
            </div>
            <div>
                <label for="captcha">${msg("Captcha")}</label>
                <div id="captcha-container">
                    <input type="text" id="captcha" name="captcha">
                    <img id="captcha-image" src="" alt="CAPTCHA">
                     <p id="captcha-error" >Incorrect CAPTCHA</p>
                    <p id="captcha-success">CAPTCHA Verified Successfully</p>
                </div>
               
                <div id="captcha-buttons">
                    <button type="button" id="refresh-captcha">${msg("Refresh Captcha")}</button>
                     <button type="button" id="verifiy-captcha">${msg("Verify Captcha")}</button>
                </div>
            </div>
            <div>
                <input type="submit" id="login-button" value="${msg("login")}" disabled>
            </div>
        </form>
    </div>
    <script src="${url.resourcesPath}/js/script.js"></script>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            var disableCopyPaste = function(field) {
                if (field) {
                    // Disable right-click context menu
                    field.addEventListener('contextmenu', function(e) {
                        e.preventDefault();
                    });

                    // Disable copy-paste
                    field.addEventListener('copy', function(e) {
                        e.preventDefault();
                    });
                    field.addEventListener('paste', function(e) {
                        e.preventDefault();
                    });

                    // Disable keyboard shortcuts (Ctrl+C, Ctrl+V, Ctrl+X)
                    field.addEventListener('keydown', function(e) {
                        if ((e.ctrlKey && e.key === 'c') || (e.ctrlKey && e.key === 'v') || (e.ctrlKey && e.key === 'x')) {
                            e.preventDefault();
                        }
                    });
                }
            };

            var usernameField = document.querySelector('input[name="username"]');
            var passwordField = document.querySelector('input[name="password"]');
            var captchaField = document.querySelector('input[name="captcha"]');
            var loginButton = document.getElementById('login-button');
            var captchaError = document.getElementById('captcha-error');
            var captchaSuccess = document.getElementById('captcha-success');
            
            
            var captchaId = '';

            disableCopyPaste(usernameField);
            disableCopyPaste(passwordField);

            
            var fetchCaptcha = function() {
                fetch('https://captcha.npinew.keenable.in/api/v1.0/captcha/')
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        const imageCaptcha = data.img;
                        captchaId = data.id;
                        document.getElementById('captcha-image').src = imageCaptcha;
                        loginButton.disabled = true;
                    })
                    .catch(error => console.error('Error:', error));
            };

            var verifyCaptcha = function(apiUrl, captchaValue){
                const payload = {
                    answer: captchaValue,
                    id: captchaId
                };
                return fetch(apiUrl,{
                    method : 'POST',
                    headers:{
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                })
                .then(response =>{
                    if(response.ststus === 201 || response.status === 200) {
                        return true;
                    } 
                    else{
                        return false;
                    }
                })
                .catch(error =>{
                    console.error('Error:', error);
                    //reutrn false;
                });
            };

        

            // Fetch CAPTCHA image on page load
            fetchCaptcha();


                //verify captcha
                var verfyCaptchaButton = document.getElementById('verifiy-captcha');
                verfyCaptchaButton.addEventListener('click',function(){
                var captchaValue = captchaField.value;
                verifyCaptcha('https://captcha.npinew.keenable.in/api/v1.0/captcha/', captchaValue)
                    .then(isValid => {
                        if (isValid) {
                           loginButton.disabled = false;
                           captchaSuccess.style.display = 'block';
                           captchaError.style.display = 'none';
                        } else {
                           loginButton.disabled = true;
                           captchaSuccess.style.display = 'none';
                           captchaError.style.display = 'block';
                           fetchCaptcha();
                        }
                    })
                });


            // Refresh CAPTCHA image
            var refreshCaptchaButton = document.getElementById('refresh-captcha');
            refreshCaptchaButton.addEventListener('click', function() {
                fetchCaptcha();
                captchaField.value = '';
                loginButton.disabled = true;
                captchaSuccess.style.display = 'none';
                captchaError.style.display = 'none';
            });
        });
    </script>
</body>
</html>



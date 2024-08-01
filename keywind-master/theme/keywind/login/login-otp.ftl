<!DOCTYPE html>
<html lang="en">
<head>
    <title>OTP Login</title>
    <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/styles.css">
</head>
<body>
    <div id="kc-login-otp">
        <h1>${msg("otpLoginTitle")}</h1>
        <form id="kc-form-login-otp" action="${url.loginAction}" method="post">
            <div>
                <label for="otp">${msg("otp")}</label>
                <input type="text" id="otp" name="otp" autofocus autocomplete="off">
            </div>
            <div>
                <input type="submit" value="${msg("login")}">
            </div>
        </form>
    </div>
    <script src="${url.resourcesPath}/js/script.js"></script>
</body>
</html>

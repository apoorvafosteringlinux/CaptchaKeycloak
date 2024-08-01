<!DOCTYPE html>
<html lang="en">
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #error-container {
            text-align: center;
            background: white;
            padding: 3em;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h1 {
            color: #333;
            margin-bottom: 0.5em;
            font-size: 36px;
        }

        p {
            color: #555;
            font-size: 20px;
            margin-bottom: 2em;
        }

        button {
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="error-container">
        <h1>Error</h1>
        <p>Oops,Something went wrong. Please try again later.</p>
        <#--  <button onclick="window.location.reload()">Okay</button>  -->
    </div>
</body>
</html>

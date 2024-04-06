<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Funds</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
        }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        h1 {
            margin: 0;
        }
        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            color: #4caf50;
        }
        a:hover {
            text-decoration: underline;
        }
          /* Center the message box */
        .message-box {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: gray;
            padding: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        /* Style the OK button */
        .btn-ok {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-ok:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Transfer Funds</h1>
        <% if(request.getAttribute("msg") != null){ %>
        <div id="messageBox" class="message-box">
        <h1>${requestScope.msg}</h1>
        <button id="btnOk" class="btn-ok">OK</button>
        </div>
    <script>
        // Reload the page when OK button is clicked
        document.getElementById("btnOk").addEventListener("click", function() {
            location.reload();
        });
    </script>
    <%} %>
    
    </header>
    <main>
        <form action="transferFunds" method="post">
            <label for="recipient">Recipient:</label>
            <input type="number" id="recipient" name="recipient" required>
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>
            <button type="submit">Transfer</button>
        </form>
        <p><a href="/user/userDashboard">Back to Home</a></p>
    </main>
</body>
</html>

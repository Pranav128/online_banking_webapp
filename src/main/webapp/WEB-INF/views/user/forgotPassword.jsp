<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: auto;
            padding-top: 50px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Forgot Password</h2>
    <%-- Display error message if present --%>
   <%--  <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if> --%>
    <form method="post" action="forgotPassword">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" placeholder="Enter your email" required><br>
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>

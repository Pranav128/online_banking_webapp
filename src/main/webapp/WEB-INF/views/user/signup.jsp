<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        form {
            margin-top: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            color: #4caf50;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>User Registration</h1>
        <h4 style="color: blue;">${requestScope.msg }</h4>
    </header>
    <main>      
  <form:form action="signup" method="post" modelAttribute="user">
            <label>Username:</label>
            <form:input path="username" /><br>
            <label>Password:</label>
            <form:password path="password" /><br>
            <label>Role:</label>
            <form:input path="role" /><br>
            
            <!-- Now, add fields for the account -->
            
            <label>Account Number:</label>
            <form:input path="account.accountNumber" /><br>
            <label>Balance:</label>
            <form:input path="account.balance" /><br>

            <input type="submit" value="Register" />
        </form:form>
        
        
        <p>Already have an account? <a href='<spring:url value="/" />' >Login</a></p>
    </main>
</body>
</html>

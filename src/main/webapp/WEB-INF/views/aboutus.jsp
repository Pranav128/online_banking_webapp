<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
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
        }
        p {
            line-height: 1.6;
        }
        footer {
            text-align: center;
            margin-top: 20px;
        }
        footer ul {
            list-style: none;
            padding: 0;
        }
        footer ul li {
            display: inline;
            margin-right: 10px;
        }
        footer ul li a {
            color: #333;
            text-decoration: none;
        }
        footer ul li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>About Us</h1>
    </header>
    <main>
        <p>Welcome to our online banking platform! We strive to provide convenient, secure, and reliable banking services to our customers.</p>
        <p>Our mission is to make banking accessible to everyone, offering a range of services including account management, fund transfers, bill payments, and more.</p>
        <p>If you have any questions or need assistance, please don't hesitate to contact our customer support team. We're here to help!</p>
        <p>Thank you for choosing our online banking platform.</p>
    </main>
    <footer>
        <ul>
            <li><a href="<spring:url value='/'/> ">Home</a></li>
            <li><a href="<spring:url value='/gethelp'  />">Get Help</a></li>
            <!-- Add more links for other concerns -->
        </ul>
    </footer>
</body>
</html>

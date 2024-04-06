<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Help</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
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
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-top: 0;
            color: #333;
        }
        p {
            margin-bottom: 20px;
            line-height: 1.5;
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
        <h1>Get Help - Online Banking</h1>
    </header>
    <main>
        <h2>Contact Information</h2>
        <p>If you need assistance or have any questions, please feel free to contact our support team:</p>
        <ul>
            <li>Email: support@onlinebanking.com</li>
            <li>Phone: 123-456-7890</li>
        </ul>
    </main>
    <footer>
        <ul>
            <li><a href="<spring:url value='/'/> ">Home</a></li>
            <li><a href="<spring:url value='/aboutus'  />">AboutUs </a></li>
            <!-- Add more links for other concerns -->
        </ul>
    </footer>
</body>
</html>

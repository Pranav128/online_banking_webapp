<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Under Construction</title>
    <style>
        body {
            background-color: #e8ebf0; /* Light, neutral background */
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
            height: 100vh;
            display: flex;          
            flex-direction: column; 
            align-items: center;    
            justify-content: center; 
        }

        h1 {
            font-size: 3em;
            color: #333;          
            margin-bottom: 15px;  
        }

        p {
            font-size: 1.2em;     
            margin-bottom: 25px; 
        }

        /* Optional countdown - you'll need JavaScript for the functionality */
        #countdown {
            font-size: 2em;     
            margin-bottom: 20px; 
        }

        /* Customize these for social links, if included */
        .social-links {
            list-style-type: none;
            padding: 0;
        }

        .social-links li {
            display: inline-block;
            margin: 0 10px; 
        }
    </style>
</head>
<body>
    <h1>We're Under Construction!</h1>
    <p>Something awesome is coming soon. Stay tuned!</p>

    <div id="countdown"></div> 

    <ul class="social-links">
        <li><a href='<spring:url value="/admin/adminDashboard"/>' >Dashboard</a></li>
        <li><a href='<spring:url value="/user/logout"/>' >Logout</a></li>
    </ul>
</body>
</html>

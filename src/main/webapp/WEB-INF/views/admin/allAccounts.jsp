<%@page import="com.app.banking.pojos.Account,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Accounts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .centered {
            text-align: center;
            margin-top: 20px;
        }
        .centered a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
        }
        .centered a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>All Accounts</h1>
    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Balance</th>
                <th>Owner</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
           <% HttpSession session2 = request.getSession();
                List<Account> accs = (List<Account>)session2.getAttribute("listAccs");
                if (accs != null) {
                    for (Account account : accs) {
            %>
            <tr>
                <td><%= account.getAccountNumber() %></td>
                <td><%= account.getBalance() %></td>
                <td><%= account.getUser().getUsername() %></td>
                <!-- Add more columns as needed -->
            </tr>
            <% 
                    }
                }
            %>
        </tbody>
    </table>
    
    <div class="centered">
        <a href='<spring:url value="/admin/adminDashboard"/>'>Back to Dashboard</a>
    </div>
</body>
</html>

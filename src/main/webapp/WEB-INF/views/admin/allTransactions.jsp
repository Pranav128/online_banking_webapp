<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="java.util.List,com.app.banking.pojos.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Transactions</title>
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
    <h1>All Transactions</h1>
    <table>
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Account Number</th>
                <th>Amount</th>
                <th>Transaction Date</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <% 
                List<Transaction> transactions = (List<Transaction>) session.getAttribute("listTxs");
                if (transactions != null) {
                    for (Transaction transaction : transactions) {
            %>
            <tr>
                <td><%= transaction.getId() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getAccount().getAccountNumber() %></td>
                <td><%= transaction.getDateTime() %></td>
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

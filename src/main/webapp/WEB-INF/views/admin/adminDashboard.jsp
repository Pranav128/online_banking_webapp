<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        h1 {
            margin: 0;
        }
        nav {
            background-color: #444;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 20px;
            padding: 10px 0;
            display: inline-block;
            border-bottom: 2px solid transparent;
            transition: border-color 0.3s;
        }
        nav a:hover {
            border-color: #fff;
        }
        main {
            padding: 20px;
        }
        section a {
            display: block;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s;
        }
        section a:hover {
            background-color: #f0f0f0;
        }
        section {
            margin-bottom: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        footer {s
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>
    <nav>
        <a href='<spring:url value="/admin/adminDashboard"/>'>Dashboard</a>
        <a href='<spring:url value="/admin/allUsers"/>'>Users</a>
        <a href='<spring:url value="/admin/allAccounts"/>'>Accounts</a>
        <a href='<spring:url value="/admin/allTransactions"/>'>Transactions</a>
        <!-- Add more navigation links as needed -->
    </nav>
    <main>
        <section>
            <a href='<spring:url value="/admin/manageUsers"/>'>
                <h2>User Management</h2>
                <p>Manage users, their roles, and permissions.</p>
            </a>
            <!-- Add user management content here -->
        </section>
        <section>
            <a href='<spring:url value="/admin/manageAccounts"/>'>
                <h2>Account Management</h2>
                <p>View and manage accounts, balances, and transactions.</p>
            </a>
            <!-- Add account management content here -->
        </section>
        <!-- Add more sections as needed -->
    </main>
    <footer>
        &copy; 2024 My Bank App
    </footer>
</body>
</html>

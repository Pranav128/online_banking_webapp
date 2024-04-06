<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.List, com.app.banking.pojos.Account"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Accounts</title>
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
h3 {
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
	text-align: center;
}

th {
	background-color: #f2f2f2;
	text-align: center;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

form {
	text-align: center;
	margin-bottom: 20px;
}

input[type="text"] {
	padding: 8px;
	width: 300px;
	margin-right: 10px;
}

input[type="submit"] {
	padding: 8px 20px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #555;
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
	<h1>Manage Accounts</h1>

	<h3>${requestScope.msg}</h3>
	<!-- Search form -->
	<form action="manageAccounts" method="post">
		<label for="search">Search Account:</label> <input type="text"
			id="search" name="search"
			placeholder="Enter account number or username"> <input
			type="submit" value="Search">
	</form>

	<!-- Display the list of accounts -->
	<%
	HttpSession session2 = request.getSession();
	List<Account> accs = (List<Account>) session2.getAttribute("search");
	if (accs != null && !accs.isEmpty()) {
	%>
<%-- 	<h3>${requestScope.msg}</h3> --%>
	<table>
		<thead>
			<tr>
				<th rowspan="2">Account Number</th>
				<th rowspan="2">Balance</th>
				<th rowspan="2">Owner</th>
				<th colspan="3">Action</th>
			</tr>
			<tr>
				<th>Update</th>
				<th>Delete</th>
				<th>View</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Account account : accs) {
			%>
			<tr>
				<td><%=account.getAccountNumber()%></td>
				<td>$<%=account.getBalance()%></td>
				<td><%=account.getUser().getUsername()%></td>
				<td><a
					href="updateAccount/<%= account.getAccountNumber() %>">Update</a></td>
				<td><a
					href="deleteAccount/<%= account.getId() %>">Delete</a></td>
				<td><a
					href="viewAccount/<%= account.getId() %>">View</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	}
	%>
	<!-- Back to Dashboard link -->
	<div class="centered">
		<a href='<spring:url value="/admin/adminDashboard"/>'>Back to Dashboard</a>
	</div>
</body>
</html>

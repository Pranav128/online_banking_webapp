<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Your Online Banking Account</title>
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
	margin-bottom: 20px;
}

ul {
	list-style: none;
	padding: 0;
	text-align: center;
}

li {
	margin-bottom: 10px;
}

a {
	text-decoration: none;
	color: #4caf50;
	display: inline-block;
	padding: 10px 20px;
	border: 1px solid #4caf50;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

a:hover {
	background-color: #4caf50;
	color: #fff;
}

.profile {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 30px;
}

.profile-icon {
	width: 30px;
	height: 102px;
	padding-bottom:40px;
	background-color: #ccc;
	border-radius: 160%;
	margin-right: 150px;
	flex-shrink: 0;
}

.profile-details {
	flex-grow: 1;
}

.important-info {
	margin-top: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<h1>Welcome to Your Online Banking Account</h1>
		<h3>${requestScope.msg}</h3>
	</header>
	<main>
		<div class="profile">
			<div class="profile-icon">
				<img alt="user_ico"
					src="data:image/png;base64,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">
			</div>
			<div class="profile-details">
				<p>
					Welcome, <strong>${sessionScope.user.username}</strong>
				</p>
				<p>
					Account Number: <strong>${sessionScope.user.account.accountNumber }</strong>
				</p>
				<!--   <p>Account Type: <strong>Savings</strong></p>-->
			</div>
		</div>
		<h2>Quick Links:</h2>
		<ul>
			<li><a href='<spring:url value="/user/viewBalance" />'>View
					Balance</a></li>
			<li><a href='<spring:url value="/user/transferFunds" />'>Transfer
					Funds</a></li>
			<li><a href='<spring:url value="/user/transactionHistory" />'>Payment
					History</a></li>
			<li><a href='<spring:url value="/user/changePass" />'>Change
					Password</a></li>
			<li><a href='<spring:url value="/user/logout" />'>Logout</a></li>
		</ul>
		<div class="important-info">
			<p>
				If you notice any suspicious activity, please <br>
				<a href="/gethelp">contact
					customer support</a>.
			</p>
		</div>
	</main>
</body>
</html>

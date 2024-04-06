<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Banking</title>
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
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-top: 0;
	margin-bottom: 20px;
	color: #333;
}

h4 {
	margin-top: 0;
	margin-bottom: 20px;
	color: blue;
}

form {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
	color: #333;
}

input[type="text"], input[type="password"], button {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

a {
	text-decoration: none;
	color: #4caf50;
}

a:hover {
	text-decoration: underline;
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
}
</style>
</head>
<body>
	<header>
		<h1>Welcome to Online Banking</h1>
	</header>
	<main>
		<section id="user-login">
			<h2>User Login</h2>
			<br>
			<h4>${requestScope.msg}</h4>
			<form action="user/login" method="post">
				<label for="username">Username:</label> 
				<input type="text" id="username" name="username" required> 
				<label for="password">Password:</label> 
				<input type="password" id="password" name="password" required>
				<button type="submit">Login</button>
				<a href="user/forgotPassword">Forgot Password?</a>
			</form>
		</section>
		<!-- <section id="admin-login">
			<p>
				<a href="/admin/login">Admin Login</a>
			</p>
		</section> -->
		<section id="user-signup">
			<p>
				<a href="/user/signup">SignUp</a>
			</p>
		</section>
	</main>
	<footer>
		<ul>
			<li><a href="<spring:url value='/gethelp'  />">Get Help</a></li>
			<li><a href="<spring:url value='/aboutUs'/> ">About Us</a></li>
			<!-- Add more links for other concerns -->
		</ul>
	</footer>
</body>
</html>
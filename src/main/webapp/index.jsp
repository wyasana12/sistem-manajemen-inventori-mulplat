<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<h2>Dashboard</h2>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	if(usernameOrEmail != null ) {
	%>
	<p>Selamat Datang, <%= usernameOrEmail %>!</p>
	<a href="./exe/exeLogout.jsp">Logout</a>
	<% } else {%>
	<p>Harap Login Terlebih Dahulu</p>
	<a href="./view/login.jsp">Login</a>
	<% } %>
</body>
</html>
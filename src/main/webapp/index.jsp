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
	<p>Belum Mempunyai Akun?</p>
	<a href="./view/register.jsp">Register</a>
	<% } %>
	<h3>Side Bar</h3>
	<a href="./view/daftarBarang.jsp">Barang</a>
	<a href="./view/daftarSupplier.jsp">Supplier</a>
	<a href="./view/daftarTransaksi.jsp">Transaksi</a>
</body>
</html>
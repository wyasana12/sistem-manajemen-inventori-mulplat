<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Barang</title>
</head>
<body>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	%>
	<form action="../exe/exeTambahBarang.jsp" method="POST">
		Nama Barang<input type="text" name="nama_barang"><br>
		Kategori<input type="text" name="kategori"><br> Stok<input
			type="text" name="stok"><br> Harga<input type="text"
			name="harga"><br> <input type="submit" name="submit"
			value="simpan">
	</form>
</body>
</html>
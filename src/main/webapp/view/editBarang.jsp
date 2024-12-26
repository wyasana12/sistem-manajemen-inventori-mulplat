<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Barang</title>
</head>
<body>
	<%@ page import="dao.*" %>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	int id = Integer.parseInt(request.getParameter("id"));
	barangModel bM = new barangModel();
	barang b = null;
	
	for (barang item : bM.getAllBarang()) {
		if (item.getId() == id) {
			b = item;
			break;
		}
	}
	%>
	<%
	if(b != null) {
	%>
	<h2>Edit Barang</h2>
	<form action="../exe/exeUpdateBarang.jsp" method="POST">
	<input type="hidden" name="id" value="<%= b.getId() %>" />
	Nama Barang<input type="text" name="nama_barang" value="<%= b.getNama_barang() %>" required><br>
	Kategori<input type="text" name="kategori" value="<%= b.getKategori()%>"><br>
	Stok<input type="text" name="stok" value="<%= b.getStok()%>" required><br>
	Harga<input type="text" name="harga" value="<%= b.getHarga() %>" required><br>
	<input type="submit" name="submit" value="simpan">
	</form>
	<%
	} else {
	%>
	<p>Barang Tidak Ada</p>
	<a href="../view/daftarBarang.jsp">Kembali ke daftar barang</a>
	<% } %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Supplier</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	supplierModel sM = new supplierModel();
	supplier s = null;

	for (supplier item : sM.getAllSupplier()) {
		if (item.getId() == id) {
			s = item;
			break;
		}
	}
	%>
	<%
	if (s != null) {
	%>
	<h2>Edit Supplier</h2>
	<form action="../exe/exeUpdateSupplier.jsp" method="POST">
	<input type="hidden" name="id" value="<%= s.getId() %>">
	Nama Supplier<input type="text" name="nama_supplier" value="<%= s.getNama_supplier() %>" required><br>
	Kontak<input type="text" name="kontak" value="<%= s.getKontak() %>" required><br>
	Alamat<textarea name="alamat"><%= s.getAlamat() %></textarea><br>
	<input type="submit" name="submit" value="simpan">
	</form>
	<%
	} else {
	%>
	<p>Supplier Tidak Ada</p>
	<a href="../view/daftarSupplier.jsp">Kembali ke daftar supplier</a>
	<% } %>
</body>
</html>
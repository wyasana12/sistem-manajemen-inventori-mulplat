<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Barang</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	if(usernameOrEmail != null ) {
	%>
	<a href="./tambahBarang.jsp">Add Barang</a>
	<%}%>
	<table>
		<tr>
			<td>No</td>
			<td>Nama Barang</td>
			<td>Kategori</td>
			<td>Stok</td>
			<td>Harga</td>
			<td>Tanggal Tambah</td>
			<td>Tanggal Update</td>
			<%
			if(usernameOrEmail != null ) {
			%>
			<td>Aksi</td>
			<%}%>
		</tr>
		<%
		barangModel bM = new barangModel();
		int countBarang = bM.getAllBarang().size();
		int no = 0;
		for (int i = 0; i < countBarang; i++) {
		%>
		<tr>
			<td>
				<% out.print(++no); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getNama_barang()); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getKategori()); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getStok()); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getHarga()); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getCreated_at()); %>
			</td>
			<td>
				<% out.print(bM.getAllBarang().get(i).getUpdated_at()); %>
			</td>
			<%
			if(usernameOrEmail != null ) {
			%>
			<td><a
				href="./editBarang.jsp?id=<%out.print(bM.getAllBarang().get(i).getId());%>">Edit
					Barang</a> <a
				href="../exe/exeDeleteBarang.jsp?id=<%out.print(bM.getAllBarang().get(i).getId());%>">Hapus
					Barang</a></td>
			<%}%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
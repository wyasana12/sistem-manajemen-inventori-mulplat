<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Transaksi</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	if(usernameOrEmail != null ) {
	%>
	<a href="./tambahTransaksi.jsp">Tambah Transaksi</a>
	<% } %>
	<table>
		<tr>
			<td>No</td>
			<td>Barang</td>
			<td>User</td>
			<td>Supplier</td>
			<td>Jenis Transaksi</td>
			<td>Jumlah</td>
			<td>Tanggal</td>
			<% 	
			if(usernameOrEmail != null ) {
			%>
			<td>Aksi</td>
			<% } %>
		</tr>
		<%
		transaksiModel tM = new transaksiModel();
		int countTransaksi = tM.getAllTransaksi().size();
		int no = 0;
		for (int i = 0; i < countTransaksi; i++) {
		%>
		<tr>
			<td><%=++no%></td>
			<td><%=tM.getAllTransaksi().get(i).getId_barang()%></td>
			<td><%=tM.getAllTransaksi().get(i).getId_user()%></td>
			<td><%=tM.getAllTransaksi().get(i).getSupplier_id()%></td>
			<td><%=tM.getAllTransaksi().get(i).getJenis_transaksi()%></td>
			<td><%=tM.getAllTransaksi().get(i).getJumlah()%></td>
			<td><%=tM.getAllTransaksi().get(i).getTanggal()%></td>
			<% 	
			if(usernameOrEmail != null ) {
			%>
			<td>
				<a href="./editTransaksi.jsp?id=<% out.print(tM.getAllTransaksi().get(i).getId());%>">Edit</a>
				<a href="../exe/exeDeleteTransaksi.jsp?id=<% out.print(tM.getAllTransaksi().get(i).getId());%>">Hapus</a>
			</td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
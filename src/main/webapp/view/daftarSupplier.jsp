<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Supplier</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<a href="./tambahSupplier.jsp">Tambah Supplier</a>
	<table>
		<tr>
			<td>No</td>
			<td>Nama Supplier</td>
			<td>Kontak</td>
			<td>Alamat</td>
			<td>Tanggal Dibuat</td>
			<td>Tanggal Diupdate</td>
			<td>Aksi</td>
		</tr>
		<%
		supplierModel sM = new supplierModel();
		int countSupplier = sM.getAllSupplier().size();
		int no = 0;
		for (int i = 0; i < countSupplier; i++) {
		%>
		<tr>
			<td>
				<%
				out.print(++no);
				%>
			</td>
			<td>
				<%
				out.print(sM.getAllSupplier().get(i).getNama_supplier());
				%>
			</td>
			<td>
				<%
				out.print(sM.getAllSupplier().get(i).getKontak());
				%>
			</td>
			<td>
				<%
				out.print(sM.getAllSupplier().get(i).getAlamat());
				%>
			</td>
			<td>
				<%
				out.print(sM.getAllSupplier().get(i).getCreated_at());
				%>
			</td>
			<td>
				<%
				out.print(sM.getAllSupplier().get(i).getUpdated_at());
				%>
			</td>
			<td>
			<a href="./editSupplier.jsp?id=<% out.print(sM.getAllSupplier().get(i).getId()); %>">Edit Supplier</a>
			<a href="../exe/exeDeleteSupplier.jsp?id=<% out.print(sM.getAllSupplier().get(i).getId());%>">Hapus Supplier</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
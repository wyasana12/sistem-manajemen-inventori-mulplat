<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Transaksi</title>
</head>
<body>
	<%@ page import="dao.*, java.util.*"%>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
    %>
	<form action="../exe/exeTambahTransaksi.jsp" method="POST">
		<input type="hidden" name="usernameOrEmail">
		<label for="id_barang">Nama Barang: </label>
		<select name="id_barang" required>
			<%
			barangModel bM = new barangModel();
			int countBarang = bM.getAllBarang().size();
			for (int i = 0; i < countBarang; i++) {
			%>
			<option value="<%=bM.getAllBarang().get(i).getId()%>"><%=bM.getAllBarang().get(i).getNama_barang()%></option>
			<%
			}
			%>
		</select>
		<label for="supplier_id">Nama Supplier: </label>
		<select name="supplier_id" required>
			<%
			supplierModel sM = new supplierModel();
			int countSupplier = sM.getAllSupplier().size();
			for (int i = 0; i < countSupplier; i++) {
			%>
			<option value="<%=sM.getAllSupplier().get(i).getId()%>"><%=sM.getAllSupplier().get(i).getNama_supplier()%></option>
			<%
			}
			%>
		</select>
		<label for="jenis_transaksi">Jenis Transaksi: </label>
		<select name="jenis_transaksi" required>
			<option value="masuk">Masuk</option>
			<option value="keluar">Keluar</option>
		</select>
		<label for="jumlah">Jumlah: </label>
		<input type="text" name="jumlah" required><br>
		<label for="tanggal">Tanggal: </label>
		<input type="date" name="tanggal" required><br>
		<input type="submit" name="submit" value="submit">
	</form>
</body>
</html>
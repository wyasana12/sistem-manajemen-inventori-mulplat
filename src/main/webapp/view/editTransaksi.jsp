<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Transaksi</title>
</head>
<body>
	<%@ page import="dao.*, java.util.*"%>
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	int id = Integer.parseInt(request.getParameter("id"));
	transaksiModel tM = new transaksiModel();
	transaksi t = null;

	for (transaksi item : tM.getAllTransaksi()) {
		if (item.getId() == id) {
			t = item;
			break;
		}
	}
	%>
	<%
	if (t != null) {
	%>
	<h2>Edit Transaksi</h2>
	<form action="../exe/exeUpdateTransaksi.jsp" method="POST">
		<input type="hidden" name="id" value="<%=t.getId()%>"> <input
			type="hidden" name="usernameOrEmail"> <label for="id_barang">Nama
			Barang: </label> <select name="id_barang" required>
			<%
			barangModel bM = new barangModel();
			int countBarang = bM.getAllBarang().size();
			for (int i = 0; i < countBarang; i++) {
			%>
			<option value="<%=bM.getAllBarang().get(i).getId()%>"><%=bM.getAllBarang().get(i).getNama_barang()%></option>
			<%
			}
			%>
		</select> <label for="supplier_id">Nama Supplier: </label> <select
			name="supplier_id" required>
			<%
			supplierModel sM = new supplierModel();
			int countSupplier = sM.getAllSupplier().size();
			for (int i = 0; i < countSupplier; i++) {
			%>
			<option value="<%=sM.getAllSupplier().get(i).getId()%>"><%=sM.getAllSupplier().get(i).getNama_supplier()%></option>
			<%
			}
			%>
		</select> <label for="jenis_transaksi">Jenis Transaksi: </label> <select
			name="jenis_transaksi" required>
			<option value="masuk">Masuk</option>
			<option value="keluar">Keluar</option>
		</select> <label for="jumlah">Jumlah: </label> <input type="text" name="jumlah"
			value="<%=t.getJumlah()%>" required><br> <label
			for="tanggal">Tanggal: </label> <input type="date" name="tanggal"
			value="<%=t.getTanggal()%>" required><br> <input
			type="submit" name="submit" value="submit">
	</form>
	<%
	} else {
	%>
	<p>Transaksi Tidak Ada</p>
	<a href="../view/daftarTransaksi.jsp">Kembali ke daftar transaksi</a>
	<% } %>
</body>
</html>
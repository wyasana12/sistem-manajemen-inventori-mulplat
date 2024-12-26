<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Update Transaksi</title>
</head>
<body>
	<%@ page import="dao.*, dao.transaksi.JenisTransaksi, java.sql.*"%>
	<%
	transaksiModel tM = new transaksiModel();
	userModel uM = new userModel();

	try {
		String usernameOrEmail = (String) session.getAttribute("id");
		if (usernameOrEmail == null) {
			out.println("<script>alert('Anda Belum Login, Harap Login Terlebih Dahulu!')</script>");
			response.sendRedirect("../view/login.jsp");
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		Integer id_user = uM.getUserIdByEmail(usernameOrEmail);
		int id_barang = Integer.parseInt(request.getParameter("id_barang"));
		int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
		String jenis_transaksi = request.getParameter("jenis_transaksi");
		int jumlah = Integer.parseInt(request.getParameter("jumlah"));
		String tanggal = request.getParameter("tanggal");

		JenisTransaksi jenisTransaksiEnum = JenisTransaksi.valueOf(jenis_transaksi.toLowerCase());

		transaksi t = new transaksi();
		t.setId(id);
		t.setId_barang(id_barang);
		t.setSupplier_id(supplier_id);
		t.setJenis_transaksi(jenisTransaksiEnum);
		t.setJumlah(jumlah);
		t.setTanggal(Date.valueOf(tanggal));
		t.setId_user(id_user);
		
		boolean isSuccess = tM.updateTransaksi(t);
		if (isSuccess) {
			out.println("<script>alert('Transaksi Berhasil Terupdate!')</script>");
		} else {
			out.println("<script>alert('Transaksi Gagal Terupdate!')</script>");
		}
	} catch (NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
	location.href= "../view/daftarTransaksi.jsp"
	</script>
</body>
</html>
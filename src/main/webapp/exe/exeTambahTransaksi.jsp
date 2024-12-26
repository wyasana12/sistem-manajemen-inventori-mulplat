<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Tambah Transaksi</title>
</head>
<body>
	<%@ page import="java.sql.Date, dao.*, dao.transaksi.JenisTransaksi"%>
	<%
	transaksiModel tM = new transaksiModel();
	userModel uM = new userModel();

	try {
		// Ambil session untuk id user
		String usernameOrEmail = (String) session.getAttribute("id");
		if (usernameOrEmail == null) {
			out.println("<script>alert('Anda Belum Login, Harap Login Terlebih Dahulu!')</script>");
			response.sendRedirect("../view/login.jsp");
		}
	
		Integer id_user = uM.getUserIdByEmail(usernameOrEmail);		// Ambil data dari form
		int id_barang = Integer.parseInt(request.getParameter("id_barang"));
		int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
		String jenis_transaksi = request.getParameter("jenis_transaksi");
		int jumlah = Integer.parseInt(request.getParameter("jumlah"));
		String tanggal = request.getParameter("tanggal"); // Format: YYYY-MM-DD
		
        JenisTransaksi jenisTransaksiEnum = JenisTransaksi.valueOf(jenis_transaksi.toLowerCase());

		transaksi t = new transaksi();
		t.setId_barang(id_barang);
		t.setSupplier_id(supplier_id);
		t.setJenis_transaksi(jenisTransaksiEnum);
		t.setJumlah(jumlah);
		t.setTanggal(Date.valueOf(tanggal));
		t.setId_user(id_user);
		// Proses transaksi
		boolean isSuccess = tM.insertTransaksi(t);
		if (isSuccess) {
			out.println("<script>alert('Transaksi Berhasil!')</script>");
		} else {
			out.println("<script>alert('Transaksi Gagal!')</script>");
		}
	} catch (NumberFormatException err) {
		err.printStackTrace();
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/daftarTransaksi.jsp"
	</script>
</body>
</html>

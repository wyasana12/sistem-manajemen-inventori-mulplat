<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Hapus Transaksi</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	transaksiModel tM = new transaksiModel();

	try {
		int id = Integer.parseInt(request.getParameter("id"));

		transaksi t = new transaksi();
		t.setId(id);

		boolean isSuccess = tM.deleteTransaksi(id);
		if (isSuccess) {
			out.println("<script>alert('Transaksi Berhasil Dihapus!')</script>");
		} else {
			out.println("<script>alert('Transaksi Gagal Dihapus!')</script>");
		}
	} catch (NumberFormatException err) {
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
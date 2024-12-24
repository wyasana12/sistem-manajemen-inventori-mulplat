<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Tambah Supplier</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	supplierModel sM = new supplierModel();

	try {
		String nama_supplier = request.getParameter("nama_supplier");
		String kontak = request.getParameter("kontak");
		String alamat = request.getParameter("alamat");

		supplier s = new supplier();
		s.setNama_supplier(nama_supplier);
		s.setKontak(kontak);
		s.setAlamat(alamat);

		boolean isSuccess = sM.insertSupplier(s);
		if (isSuccess) {
			out.println("<script>alert('Supplier Berhasil Ditambahkan!')</script>");
		} else {
			out.println("<script>alert('Supplier Berhasil Dihapus!')</script>");
		}
	} catch (NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/daftarSupplier.jsp"
	</script>
</body>
</html>
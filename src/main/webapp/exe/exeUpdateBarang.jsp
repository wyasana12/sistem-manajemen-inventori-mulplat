<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Update Barang</title>
</head>
<body>
	<%@ page import="dao.*" %>
	<%
	barangModel bM = new barangModel();
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		String nama_barang = request.getParameter("nama_barang");
		String kategori = request.getParameter("kategori");
		int stok = Integer.parseInt(request.getParameter("stok"));
		double harga = Double.parseDouble(request.getParameter("harga"));
		
		barang b = new barang();
		b.setId(id);
		b.setNama_barang(nama_barang);
		b.setKategori(kategori);
		b.setStok(stok);
		b.setHarga(harga);
		
		boolean isSuccess = bM.updateBarang(b);
		if(isSuccess) {
			out.println("<script>alert('Barang Berhasil Terupdate!')</script>");
		} else {
			out.println("<script>alert('Barang Gagal Terupdate!')</script>");	
		}
	} catch(NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch(Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/daftarBarang.jsp"
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Delete Barang</title>
</head>
<body>
	<%@ page import="dao.*" %>
	<%
	barangModel bM = new barangModel();
	
	try{
		int id = Integer.parseInt(request.getParameter("id"));
		
		barang b = new barang();
		b.setId(id);
		
		boolean isSuccess = bM.deleteBarang(id);
		if (isSuccess) {
			out.println("<script>alert('Barang Berhasil Dihapus!')</script>");
		} else {
			out.println("<script>alert('Barang Gagal Dihapus!')</script>");
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
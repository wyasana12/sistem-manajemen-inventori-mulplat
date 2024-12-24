<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Delete Supplier</title>
</head>
<body>
	<%@ page import="dao.*" %>
	<%
	supplierModel sM = new supplierModel();
	
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		
		supplier s = new supplier();
		s.setId(id);
		
		boolean isSuccess = sM.deleteSupplier(id);
		if(isSuccess) {
			out.println("<script>alert('Supplier Berhasil Dihapus!')</script>");
		} else {
			out.println("<script>alert('Supplier Gagal Dihapus!')</script>");
		}
	} catch(NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch(Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
	location.href = "../view/daftarSupplier.jsp"
	</script>
</body>
</html>
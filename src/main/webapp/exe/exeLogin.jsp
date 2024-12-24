<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Login Akun</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	userModel uM = new userModel();
	try {
		String usernameOrEmail = request.getParameter("usernameOrEmail");
		String password = request.getParameter("password");

		if (uM.loginUser(usernameOrEmail, password)) {
			session.setAttribute("id", usernameOrEmail);
			out.println("<script>alert('Login berhasil!')</script>");
			response.sendRedirect("../index.jsp");
		} else {
			out.println("<script>alert('Username atau Email atau Password yang Anda Masukkan Salah!')</script>");
			response.sendRedirect("../view/login.jsp");
		}
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
</body>
</html>
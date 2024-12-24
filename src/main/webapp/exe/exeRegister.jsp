<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Register Akun</title>
</head>
<body>
	<%@ page import="dao.*"%>
	<%
	userModel uM = new userModel();

	try {
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_confirmation = request.getParameter("password_confirmation");

		if (!password.equals(password_confirmation)) {
			out.println("<script>alert('Password dan Konfirmasi Tidak Cocok!')</script>");
		} else {
			user u = new user();
			u.setFullname(fullname);
			u.setEmail(email);
			u.setUsername(username);
			u.setPassword(password);

			boolean isSuccess = uM.registerUser(u);
			if (isSuccess) {
		out.println("<script>alert('Registrasi berhasil!')</script>");
			} else {
		out.println("<script>alert('Registrasi gagal!')</script>");
			}
		}
	} catch (NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/login.jsp"
	</script>
</body>
</html>
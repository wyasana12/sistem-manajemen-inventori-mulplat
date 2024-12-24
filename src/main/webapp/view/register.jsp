<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Akun</title>
</head>
<body>
	<form action="../exe/exeRegister.jsp" method="POST">
		Nama Lengkap<input type="text" name="fullname" required><br>
		Email<input type="text" name="email" required><br>
		Username<input type="text" name="username" required><br>
		Password<input type="password" name="password" required><br>
		Konfirmasi Password<input type="password" name="password_confirmation" required><br>
		<input type="submit" name="submit" value="submit">
	</form>
</body>
</html>
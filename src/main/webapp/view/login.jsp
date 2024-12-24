<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Akun</title>
</head>
<body>
	<form action="../exe/exeLogin.jsp" method="POST">
		Username atau Email<input type="text" name="usernameOrEmail" required><br>
		Password<input type="password" name="password" required><br>
		<input type="submit" name="submit" value="submit">
	</form>
	<p>Harap Login Terlebih Dahulu</p>
	<a href="./view/login.jsp">Login</a>
</body>
</html>
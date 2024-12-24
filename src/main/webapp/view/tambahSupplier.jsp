<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Supplier</title>
</head>
<body>
	<form action="../exe/exeTambahSupplier.jsp" method="POST">
	Nama Supplier<input type="text" name="nama_supplier" required><br>
	Kontak<input type="text" name="kontak" required><br>
	Alamat<textarea name="alamat"></textarea><br>
	<input type="submit" name="submit" value="simpan">
	</form>
</body>
</html>
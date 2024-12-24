package dao;

import java.sql.*;
import java.util.ArrayList;

public class barangModel {
	Connection con;
	Statement st;
	ResultSet rs;
	ArrayList<barang> listBarang;

	public barangModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/sistemInventaris?user=root&password=";
			con = DriverManager.getConnection(url);
			listBarang = new ArrayList<>();
		} catch (ClassNotFoundException err) {
			err.printStackTrace();
		} catch (SQLException err) {
			err.printStackTrace();
		}
	}

	public ArrayList<barang> getAllBarang() {
		String query = "SELECT * FROM barang";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				barang b = new barang();
				b.setId(rs.getInt("id"));
				b.setNama_barang(rs.getString("nama_barang"));
				b.setKategori(rs.getString("kategori"));
				b.setStok(rs.getInt("stok"));
				b.setHarga(rs.getDouble("harga"));
				b.setCreated_at(rs.getTimestamp("created_at"));
				b.setUpdated_at(rs.getTimestamp("updated_at"));
				listBarang.add(b);
			}
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return listBarang;
	}

	public boolean insertBarang(barang b) {
		String query = "INSERT INTO barang (nama_barang, kategori, stok, harga, created_at, updated_at) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getNama_barang());
			ps.setString(2, b.getKategori());
			ps.setInt(3, b.getStok());
			ps.setDouble(4, b.getHarga());
			int add = ps.executeUpdate();
			ps.close();
			return add > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}

	public boolean updateBarang(barang b) {
		String query = "UPDATE barang SET nama_barang = ?, kategori = ?, stok = ?, harga = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getNama_barang());
			ps.setString(2, b.getKategori());
			ps.setInt(3, b.getStok());
			ps.setDouble(4, b.getHarga());
			ps.setInt(5, b.getId());
			int edit = ps.executeUpdate();
			ps.close();
			return edit > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}

	public boolean deleteBarang(int id) {
		String query = "DELETE FROM barang WHERE id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int del = ps.executeUpdate();
			ps.close();
			return del > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
}

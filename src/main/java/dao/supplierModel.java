package dao;

import java.sql.*;
import java.util.ArrayList;

public class supplierModel {
	Connection con;
	Statement st;
	ResultSet rs;
	ArrayList<supplier> listSupplier;
	
	public supplierModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/sisteminventaris?user=root&password=";
			con = DriverManager.getConnection(url);
			listSupplier = new ArrayList<>();
		} catch(ClassNotFoundException err) {
			err.printStackTrace();
		} catch(SQLException err) {
			err.printStackTrace();
		}
	}
	
	public ArrayList<supplier> getAllSupplier() {
		ArrayList<supplier> listSupplier = new ArrayList<>();
		String query = "SELECT * FROM supplier";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				supplier s = new supplier();
				s.setId(rs.getInt("id"));
				s.setNama_supplier(rs.getString("nama_supplier"));
				s.setKontak(rs.getString("kontak"));
				s.setAlamat(rs.getString("alamat"));
				s.setCreated_at(rs.getTimestamp("created_at"));
				s.setUpdated_at(rs.getTimestamp("updated_at"));
				listSupplier.add(s);
			}
			rs.close();
			st.close();
		} catch(SQLException err) {
			err.printStackTrace();
		}
		return listSupplier;
	}
	
	public boolean insertSupplier(supplier s) {
		String query = "INSERT INTO supplier (nama_supplier, kontak, alamat, created_at, updated_at) VALUES (?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getNama_supplier());
			ps.setString(2, s.getKontak());
			ps.setString(3, s.getAlamat());
			int add = ps.executeUpdate();
			ps.close();
			return add > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
	
	public boolean updateSupplier(supplier s) {
		String query = "UPDATE supplier SET nama_supplier = ?, kontak = ?, alamat = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getNama_supplier());
			ps.setString(2, s.getKontak());
			ps.setString(3, s.getAlamat());
			int edit = ps.executeUpdate();
			ps.close();
			return edit > 0;
		} catch(SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteSupplier(int id) {
		String query = "DELETE FROM supplier WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int del = ps.executeUpdate();
			ps.close();
			return del > 0;
		} catch(SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
}

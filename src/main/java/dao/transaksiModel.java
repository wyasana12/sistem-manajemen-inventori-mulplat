package dao;

import java.sql.*;
import java.util.ArrayList;

public class transaksiModel {
	Connection con;
	Statement st;
	ResultSet rs;
	ArrayList<transaksi> listTransaksi;

	public transaksiModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/sisteminventori?user=root&password=";
			con = DriverManager.getConnection(url);
			listTransaksi = new ArrayList<>();
		} catch (ClassNotFoundException err) {
			err.printStackTrace();
		} catch (SQLException err) {
			err.printStackTrace();
		}
	}

	public ArrayList<transaksi> getAllTransaksi() {
		ArrayList<transaksi> listTransaksi = new ArrayList<>();
		String query = "SELECT * FROM transaksi";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				transaksi t = new transaksi();
				t.setId_barang(rs.getInt("id_barang"));
				t.setId_user(rs.getInt("id_user"));
				t.setSupplier_id(rs.getInt("supplier_id"));
				t.setJenis_transaksi(rs.getString("jenis_transaksi"));
				t.setJumlah(rs.getInt("jumlah"));
				t.setTanggal(rs.getDate("tanggal").toLocalDate());
				t.setCreated_at(rs.getTimestamp("created_at"));
				t.setUpdated_at(rs.getTimestamp("updated_at"));
				listTransaksi.add(t);
			}
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return listTransaksi;
	}

	public boolean insertTransaksi(transaksi t) {
		String query = "INSERT INTO transaksi (id_barang, id_user, supplier_id, jenis_transaksi, jumlah, tanggal, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, t.getId_barang());
			ps.setInt(2, t.getId_user());
			ps.setInt(3, t.getSupplier_id());
			ps.setString(4, t.getJenis_transaksi());
			ps.setInt(5, t.getJumlah());
			ps.setDate(6, Date.valueOf(t.getTanggal()));
			int add = ps.executeUpdate();
			ps.close();
			return add > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}

	public boolean updateTransaksi(transaksi t) {
		String query = "UPDATE transaksi SET id_barang = ?, id_user = ?, supplier_id = ?, jenis_transaksi = ?, tanggal = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, t.getId_barang());
			ps.setInt(2, t.getId_user());
			ps.setInt(3, t.getSupplier_id());
			ps.setString(4, t.getJenis_transaksi());
			ps.setInt(5, t.getJumlah());
			ps.setDate(6, Date.valueOf(t.getTanggal()));
			ps.setInt(7, t.getId());
			int edit = ps.executeUpdate();
			ps.close();
			return edit > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteTransaksi(int id) {
		String query = "DELETE FROM transaksi WHERE id = ?";
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

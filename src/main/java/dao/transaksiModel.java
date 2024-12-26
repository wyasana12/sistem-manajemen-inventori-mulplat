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
			String url = "jdbc:mysql://127.0.0.1/sisteminventaris?user=root&password=";
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
				t.setId(rs.getInt("id"));;
				t.setId_barang(rs.getInt("id_barang"));
				t.setId_user(rs.getInt("id_user"));
				t.setSupplier_id(rs.getInt("supplier_id"));
				t.setJenis_transaksi(transaksi.JenisTransaksi.valueOf(rs.getString("jenis_transaksi")));
				t.setJumlah(rs.getInt("jumlah"));
				t.setTanggal(rs.getDate("tanggal"));
				t.setCreated_at(rs.getTimestamp("created_at"));
				listTransaksi.add(t);
			}
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return listTransaksi;
	}

	public boolean insertTransaksi(transaksi t) {
		String query = "INSERT INTO transaksi (id_barang, id_user, supplier_id, jenis_transaksi, jumlah, tanggal, created_at) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
		String updateStok = "UPDATE barang SET stok = stok + ? WHERE id = ?";
		try {
			con.setAutoCommit(false);
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, t.getId_barang());
			ps.setInt(2, t.getId_user());
			ps.setInt(3, t.getSupplier_id());
			ps.setString(4, t.getJenis_transaksi().toString());
			ps.setInt(5, t.getJumlah());
			ps.setDate(6, (t.getTanggal()));
			int add = ps.executeUpdate();
			ps.close();
			
			PreparedStatement psStok = con.prepareStatement(updateStok);
			int transaksiStok = t.getJenis_transaksi() == transaksi.JenisTransaksi.masuk ? t.getJumlah() : -t.getJumlah();
			psStok.setInt(1, transaksiStok);
			psStok.setInt(2, t.getId_barang());
			psStok.executeUpdate();
			psStok.close();
			
			con.commit();
			con.setAutoCommit(true);
			return add > 0;
		} catch (SQLException err) {
			try {
				con.rollback();
			} catch(SQLException error) {
				error.printStackTrace();
			}
			err.printStackTrace();
			return false;
		}
	}

	public boolean updateTransaksi(transaksi t) {
	    String getOldTransaksiQuery = "SELECT id_barang, jenis_transaksi, jumlah FROM transaksi WHERE id = ?";
	    String updateStockQuery = "UPDATE barang SET stok = stok + ? WHERE id = ?";
	    String updateTransaksiQuery = "UPDATE transaksi SET id_barang = ?, id_user = ?, supplier_id = ?, jenis_transaksi = ?, jumlah = ?, tanggal = ? WHERE id = ?";

	    try {
	        con.setAutoCommit(false);

	        // Step 1: Ambil data transaksi lama
	        PreparedStatement psGetOld = con.prepareStatement(getOldTransaksiQuery);
	        psGetOld.setInt(1, t.getId());
	        ResultSet rsOld = psGetOld.executeQuery();

	        if (!rsOld.next()) {
	            // Jika transaksi tidak ditemukan, rollback
	            con.rollback();
	            psGetOld.close();
	            return false;
	        }

	        int oldIdBarang = rsOld.getInt("id_barang");
	        String oldJenisTransaksi = rsOld.getString("jenis_transaksi");
	        int oldJumlah = rsOld.getInt("jumlah");

	        rsOld.close();
	        psGetOld.close();

	        // Step 2: Perbarui stok berdasarkan transaksi lama
	        int oldStockAdjustment = oldJenisTransaksi.equalsIgnoreCase("masuk") ? -oldJumlah : oldJumlah;

	        PreparedStatement psUpdateOldStock = con.prepareStatement(updateStockQuery);
	        psUpdateOldStock.setInt(1, oldStockAdjustment);
	        psUpdateOldStock.setInt(2, oldIdBarang);
	        psUpdateOldStock.executeUpdate();
	        psUpdateOldStock.close();

	        // Step 3: Perbarui data transaksi
	        PreparedStatement psUpdateTransaksi = con.prepareStatement(updateTransaksiQuery);
	        psUpdateTransaksi.setInt(1, t.getId_barang());
	        psUpdateTransaksi.setInt(2, t.getId_user());
	        psUpdateTransaksi.setInt(3, t.getSupplier_id());
	        psUpdateTransaksi.setString(4, t.getJenis_transaksi().toString());
	        psUpdateTransaksi.setInt(5, t.getJumlah());
	        psUpdateTransaksi.setDate(6, t.getTanggal());
	        psUpdateTransaksi.setInt(7, t.getId());
	        psUpdateTransaksi.executeUpdate();
	        psUpdateTransaksi.close();

	        // Step 4: Perbarui stok berdasarkan transaksi baru
	        int newStockAdjustment = t.getJenis_transaksi() == transaksi.JenisTransaksi.masuk ? t.getJumlah() : -t.getJumlah();

	        PreparedStatement psUpdateNewStock = con.prepareStatement(updateStockQuery);
	        psUpdateNewStock.setInt(1, newStockAdjustment);
	        psUpdateNewStock.setInt(2, t.getId_barang());
	        psUpdateNewStock.executeUpdate();
	        psUpdateNewStock.close();

	        // Commit transaksi
	        con.commit();
	        con.setAutoCommit(true);
	        return true;
	    } catch (SQLException err) {
	        try {
	            con.rollback();
	        } catch (SQLException rollbackErr) {
	            rollbackErr.printStackTrace();
	        }
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

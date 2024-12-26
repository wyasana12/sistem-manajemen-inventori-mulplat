package dao;

import java.sql.Date;
import java.sql.Timestamp;

public class transaksi {
	private int id;
	private int id_barang;
	private int id_user;
	private int supplier_id;
	private JenisTransaksi jenis_transaksi;
	private int jumlah;
	private Date tanggal;
	private Timestamp created_at;
	private Timestamp updated_at;
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId_barang() {
		return id_barang;
	}
	
	public void setId_barang(int id_barang) {
		this.id_barang = id_barang;
	}
	
	
	public int getId_user() {
		return id_user;
	}
	
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	
	public int getSupplier_id() {
		return supplier_id;
	}
	
	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}
	
	public enum JenisTransaksi {
		masuk, keluar;
	}
	
	public JenisTransaksi getJenis_transaksi() {
		return jenis_transaksi;
	}
	
	public void setJenis_transaksi(JenisTransaksi jenis_transaksi) {
		this.jenis_transaksi = jenis_transaksi;
	}
	
	public int getJumlah() {
		return jumlah;
	}
	
	public void setJumlah(int jumlah) {
		this.jumlah = jumlah;
	}
	
	public Date getTanggal() {
		return tanggal;
	}
	
	public void setTanggal(Date tanggal) {
		this.tanggal = tanggal;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}
	
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
}

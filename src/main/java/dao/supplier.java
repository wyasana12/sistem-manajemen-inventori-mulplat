package dao;

import java.sql.Timestamp;

public class supplier {
	private int id;
	private String nama_supplier;
	private String kontak;
	private String alamat;
	private Timestamp created_at;
	private Timestamp updated_at;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNama_supplier() {
		return nama_supplier;
	}
	
	public void setNama_supplier(String nama_supplier) {
		this.nama_supplier = nama_supplier;
	}
	
	public String getKontak() {
		return kontak;
	}
	
	public void setKontak(String kontak) {
		this.kontak = kontak;
	}
	
	public String getAlamat() {
		return alamat;
	}
	
	public void setAlamat(String alamat) {
		this.alamat = alamat;
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

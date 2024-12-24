package dao;

import java.sql.Timestamp;

public class barang {
	private int id;
	private String nama_barang;
	private String kategori;
	private int stok;
	private double harga;
	private Timestamp created_at;
	private Timestamp updated_at;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNama_barang() {
		return nama_barang;
	}
	
	public void setNama_barang(String nama_barang) {
		this.nama_barang = nama_barang;
	}
	
	public String getKategori() {
		return kategori;
	}
	
	public void setKategori(String kategori) {
		this.kategori = kategori;
	}
	
	public int getStok() {
		return stok;
	}
	
	public void setStok(int stok) {
		this.stok = stok;
	}
	
	public double getHarga() {
		return harga;
	}
	
	public void setHarga(double harga) {
		this.harga = harga;
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

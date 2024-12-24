package dao;

import java.sql.*;
import java.util.ArrayList;

public class userModel {
	Connection con;
	Statement st;
	ResultSet rs;
	ArrayList<user> listUser;

	public userModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/sistemInventaris?user=root&password=";
			con = DriverManager.getConnection(url);
			listUser = new ArrayList<>();
		} catch (ClassNotFoundException err) {
			err.printStackTrace();
		} catch (SQLException err) {
			err.printStackTrace();
		}
	}

	public boolean registerUser(user u) {
		String query = "INSERT INTO users (fullname, email, username, password, created_at) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getUsername());
			ps.setString(4, Hashing.hashingPassword(u.getPassword()));
			int register = ps.executeUpdate();
			ps.close();
			return register > 0;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}

	public boolean loginUser(String usernameOrEmail, String password) {
		String query = "SELECT * FROM users WHERE (username = ? OR email = ?) AND password = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, usernameOrEmail);
			ps.setString(2, usernameOrEmail);
			ps.setString(3, Hashing.hashingPassword(password));
			ResultSet rs = ps.executeQuery();
			boolean isSuccess = rs.next();
			rs.close();
			ps.close();
			return isSuccess;
		} catch (SQLException err) {
			err.printStackTrace();
			return false;
		}
	}
}

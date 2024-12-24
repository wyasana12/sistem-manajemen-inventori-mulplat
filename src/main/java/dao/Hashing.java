package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hashing {
	public static String hashingPassword(String password) {
		try {
			MessageDigest mD = MessageDigest.getInstance("SHA-256");
			byte[] hash = mD.digest(password.getBytes());
			StringBuilder sB = new StringBuilder();
			for (byte b : hash) {
				sB.append(String.format("%02x", b));
			}
			return sB.toString();
		} catch(NoSuchAlgorithmException err) {
			err.printStackTrace();
			return null;
		}
	}
}

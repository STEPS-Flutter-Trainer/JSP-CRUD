package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.User;
import db.DBConnection;

public class UserDAO {

	public List<User> getAllUsers() throws SQLException {
		List<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		try (Connection con = DBConnection.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				users.add(user);
			}
		}
		return users;
	}

	public User getUserById(int id) throws SQLException {
		User user = null;
		String query = "SELECT * FROM users WHERE id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					user = new User();
					user.setId(rs.getInt("id"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
				}
			}
		}
		return user;
	}

	public void addUser(User user) throws SQLException {
		String query = "INSERT INTO users (name, email) VALUES (?, ?)";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.executeUpdate();
		}
	}

	public void updateUser(User user) throws SQLException {
		String query = "UPDATE users SET name = ?, email = ? WHERE id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setInt(3, user.getId());
			pstmt.executeUpdate();
		}
	}

	public void deleteUser(int id) throws SQLException {

		String query = "DELETE FROM users WHERE id = ?";

		try (Connection con = DBConnection.getConnection();

				PreparedStatement pstmt = con.prepareStatement(query))

		{

			pstmt.setInt(1, id);

			pstmt.executeUpdate();

		}
	}
}

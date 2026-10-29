package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImp implements UserDAO{

	String INSERT_QUERY = "INSERT INTO user (userName,email,password,address,role,createdDate,lastLoginDate) values (?,?,?,?,?,?,?)";

	String GETUSER_QUERY = "SELECT * FROM User Where userID = ?";

	String GETALLUSER_QUERY	 = "SELECT * FROM User";
	
	String UPDATEUSER_QUERY = "UPDATE User SET userName = ?, email = ?, password = ?, address = ?, lastLoginDate = ? where userId = ?";

	String DELETE_QUERY = "DELETE from User where userId = ?";
	
	String GETUSER_BY_EMAIL = "SELECT * FROM user WHERE email = ?";

	@Override
	public int addUser(User user) {



		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement statement = connection.prepareStatement(INSERT_QUERY);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getRole());
			statement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			statement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

			int i = statement.executeUpdate();
			return i;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;	
	}

		
	
	
	@Override
	public User getUser(int userId) {

		User user = null;
		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement statement = connection.prepareStatement(GETUSER_QUERY);
			statement.setInt(1, userId);

			ResultSet rs = statement.executeQuery();

			while(rs.next()) {
				int id = rs.getInt("userId");
				String name = rs.getString("userName");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String role = rs.getString("role");
				Timestamp createdDate = rs.getTimestamp("createdDate");
				Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

				user = new User(id,name,email,password,address,role,createdDate,lastLoginDate);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	
	@Override
	public void updateUser(User user) {
		
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(UPDATEUSER_QUERY);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getAddress());
			statement.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			statement.setInt(6, user.getUserId());
			
			int re = statement.executeUpdate();
			System.out.println(re);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	

	@Override
	public void deleteUser(int userId) {
		
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(DELETE_QUERY);
			
			statement.setInt(1, userId);
			
			int rs = statement.executeUpdate();
			
			System.out.println(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

	}
	
	
	
	
	
	
	
	

	@Override
	public List<User> getAllUser() {

		Connection connection = DBConnection.getConnection();

		ArrayList<User> list = new ArrayList<User>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(GETALLUSER_QUERY);

			while(rs.next()) {
				int id = rs.getInt("userId");
				String name = rs.getString("userName");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String role = rs.getString("role");
				Timestamp createdDate = rs.getTimestamp("createdDate");
				Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

				User user = new User(id,name,email,password,address,role,createdDate,lastLoginDate);
				list.add(user);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public User getUserByEmail(String email) {

	    User user = null;
	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement statement = connection.prepareStatement(GETUSER_BY_EMAIL);
	        statement.setString(1, email);

	        ResultSet rs = statement.executeQuery();

	        if (rs.next()) {

	            int id = rs.getInt("userId");
	            String userName = rs.getString("userName");
	            String password = rs.getString("password");
	            String address = rs.getString("address");
	            String role = rs.getString("role");
	            Timestamp createdDate = rs.getTimestamp("createdDate");
	            Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

	            user = new User(id, userName, email, password, address, role,
	                    createdDate, lastLoginDate);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	
	
	



}

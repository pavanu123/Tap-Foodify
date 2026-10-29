package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO
{
	private static final String INSERT_QUERY = "INSERT INTO restaurant(restaurantName,cuisineType,deliveryTime,restaurantAddress,rating,isActive,imagePath,adminId) VALUES(?,?,?,?,?,?,?,?)";

	private static final String GET_QUERY = "SELECT * FROM restaurant WHERE restaurantId=?";

	private static final String UPDATE_QUERY = "UPDATE restaurant SET restaurantName=?, cuisineType=?, deliveryTime=?, restaurantAddress=?, rating=?, isActive=?, imagePath=?, adminId=? WHERE restaurantId=?";

	private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId=?";
	
	private static final String GET_ALL_QUERY = "SELECT * FROM restaurant";
	
	@Override
	public void addRestaurant(Restaurant restaurant) {


		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement statement = connection.prepareStatement(INSERT_QUERY);

			statement.setString(1, restaurant.getRestaurantName());
			statement.setString(2, restaurant.getCuisineType());
			statement.setInt(3, restaurant.getDeliveryTime());
			statement.setString(4, restaurant.getRestaurantaddress());
			statement.setDouble(5, restaurant.getRating());
			statement.setBoolean(6, restaurant.isActive());
			statement.setString(7, restaurant.getImagePath());
			statement.setInt(8, restaurant.getAdminId());

			int executeUpdate = statement.executeUpdate();

			System.out.println("restaraunt added");


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		Connection connection = DBConnection.getConnection();
		Restaurant restaraunt = null;

		try {
			PreparedStatement statement = connection.prepareStatement(GET_QUERY);

			statement.setInt(1, restaurantId);

			ResultSet rs = statement.executeQuery();

			while(rs.next()) {

				int id = rs.getInt("restaurantId");
				String name = rs.getString("restaurantName");
				String cuisineType = rs.getString("cuisineType");
				int deliveryTime = rs.getInt("deliveryTime");
				String restaurantAddress = rs.getString("restaurantAddress");
				double rating = rs.getDouble("rating");
				boolean isActive = rs.getBoolean("isActive");
				String imagePath = rs.getString("imagePath");
				int adminId = rs.getInt("adminId");

				restaraunt = new Restaurant(id, name,cuisineType, deliveryTime, restaurantAddress, rating, isActive, imagePath, adminId);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return restaraunt;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		
		
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY);
			
			statement.setString(1, restaurant.getRestaurantName());
			statement.setString(2, restaurant.getCuisineType());
			statement.setInt(3, restaurant.getDeliveryTime());
			statement.setString(4, restaurant.getRestaurantaddress());
			statement.setDouble(5, restaurant.getRating());
			statement.setBoolean(6, restaurant.isActive());
			statement.setString(7, restaurant.getImagePath());
			statement.setInt(8, restaurant.getAdminId());
			statement.setInt(9, restaurant.getRestaurantId());
			
			int executeUpdate = statement.executeUpdate();
			
			System.out.println("Restaurant Updated");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}


	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		
		Connection connection = DBConnection.getConnection();
		
		PreparedStatement statement;
		try {
			statement = connection.prepareStatement(DELETE_QUERY);
			statement.setInt(1, restaurantId);
			
			int executeUpdate = statement.executeUpdate();
			
			System.out.println("RESTARaunt deleted");
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		
		Connection connection = DBConnection.getConnection();
		
		ArrayList<Restaurant> arrayList = new ArrayList<>();
		
		try {
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(GET_ALL_QUERY);
			
			while(rs.next()) {
				
				int id = rs.getInt("restaurantId");
				String name = rs.getString("restaurantName");
				String cuisineType = rs.getString("cuisineType");
				int deliveryTime = rs.getInt("deliveryTime");
				String restaurantAddress = rs.getString("restaurantAddress");
				double rating = rs.getDouble("rating");
				boolean isActive = rs.getBoolean("isActive");
				String imagePath = rs.getString("imagePath");
				int adminId = rs.getInt("adminId");
				
				Restaurant restaurant = new Restaurant(id, name, cuisineType, deliveryTime, restaurantAddress, rating, isActive, imagePath,adminId );
				
				arrayList.add(restaurant);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		

		return arrayList;
	}





}

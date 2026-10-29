package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{

	private static final String INSERT_QUERY = "INSERT INTO menu(restaurantId,itemName,description,price,isAvailable,imagePath) VALUES(?,?,?,?,?,?)";

	private static final String GET_QUERY = "SELECT * FROM menu WHERE menuId=?";

	private static final String UPDATE_QUERY = "UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, imagePath=? WHERE menuId=?";

	private static final String DELETE_QUERY = "DELETE FROM menu WHERE menuId=?";

	private static final String GET_ALL_QUERY = "SELECT * FROM menu";

	private static final String GET_BY_RESTAURANT_QUERY = "SELECT * FROM menu WHERE restaurantId=?";

	@Override
	public void addMenu(Menu menu) {

		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getImagePath());

			int res = pstmt.executeUpdate();

			System.out.println("Menu Added");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}




	@Override
	public Menu getMenu(int menuId) {

		Connection connection = DBConnection.getConnection();

		Menu menu = null;

		try {

			PreparedStatement statement = connection.prepareStatement(GET_QUERY);

			statement.setInt(1, menuId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("menuId");
				int restaurantId = rs.getInt("restaurantId");
				String itemName = rs.getString("itemName");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				boolean isAvailable = rs.getBoolean("isAvailable");
				String imagePath = rs.getString("imagePath");

				menu = new Menu(id, restaurantId, itemName, description, price, isAvailable, imagePath);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}


	@Override
	public void updateMenu(Menu menu) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY);

			statement.setInt(1, menu.getRestaurantId());
			statement.setString(2, menu.getItemName());
			statement.setString(3, menu.getDescription());
			statement.setDouble(4, menu.getPrice());
			statement.setBoolean(5, menu.isAvailable());
			statement.setString(6, menu.getImagePath());
			statement.setInt(7, menu.getMenuId());

			statement.executeUpdate();

			System.out.println("Menu Updated Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(DELETE_QUERY);

			statement.setInt(1, menuId);

			statement.executeUpdate();

			System.out.println("Menu Deleted Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Menu> getAllMenus() {

		Connection connection = DBConnection.getConnection();

		ArrayList<Menu> menuList = new ArrayList<>();

		try {

			Statement statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				int id = rs.getInt("menuId");
				int restaurantId = rs.getInt("restaurantId");
				String itemName = rs.getString("itemName");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				boolean isAvailable = rs.getBoolean("isAvailable");
				String imagePath = rs.getString("imagePath");

				Menu menu = new Menu(id, restaurantId, itemName, description, price, isAvailable, imagePath);

				menuList.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuList;

	}


	@Override
	public List<Menu> getMenuByRestaurant(int restaurantId) {

		Connection connection = DBConnection.getConnection();

		ArrayList<Menu> menuList = new ArrayList<>();

		try {

			PreparedStatement statement = connection.prepareStatement(GET_BY_RESTAURANT_QUERY);

			statement.setInt(1, restaurantId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("menuId");
				int restId = rs.getInt("restaurantId");
				String itemName = rs.getString("itemName");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				boolean isAvailable = rs.getBoolean("isAvailable");
				String imagePath = rs.getString("imagePath");

				Menu menu = new Menu(id, restId, itemName, description, price, isAvailable, imagePath);

				menuList.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuList;


	}





}

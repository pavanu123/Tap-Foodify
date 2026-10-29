package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderTableDAO;
import com.tap.model.OrderTable;
import com.tap.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO{
	
	
	private static final String INSERT_QUERY =
			"INSERT INTO ordertable(userId,orderDate,totalAmount,status,paymentMethod,restaurantId) VALUES(?,?,?,?,?,?)";

	private static final String GET_QUERY =
			"SELECT * FROM ordertable WHERE orderId=?";

	private static final String UPDATE_QUERY =
			"UPDATE ordertable SET userId=?, orderDate=?, totalAmount=?, status=?, paymentMethod=?, restaurantId=? WHERE orderId=?";

	private static final String DELETE_QUERY =
			"DELETE FROM ordertable WHERE orderId=?";

	private static final String GET_ALL_QUERY =
			"SELECT * FROM ordertable";

	private static final String GET_BY_USER_QUERY =
			"SELECT * FROM ordertable WHERE userId=?";
	
	@Override
	public int addOrder(OrderTable order) {

		int orderId= 0;
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(INSERT_QUERY,Statement.RETURN_GENERATED_KEYS);

			statement.setInt(1, order.getUserId());
			statement.setTimestamp(2, order.getOrderDate());
			statement.setDouble(3, order.getTotalAmount());
			statement.setString(4, order.getStatus());
			statement.setString(5, order.getPaymentMethod());
			statement.setInt(6, order.getRestaurantId());

			statement.executeUpdate();
			
			ResultSet res = statement.getGeneratedKeys();
			if(res.next()) {
				orderId = res.getInt(1);
			}

			System.out.println("Order Added Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
		
		
		
	}
	
	@Override
	public OrderTable getOrder(int orderId) {
		
		Connection connection = DBConnection.getConnection();

		OrderTable order = null;

		try {

			PreparedStatement statement = connection.prepareStatement(GET_QUERY);

			statement.setInt(1, orderId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderId");
				int userId = rs.getInt("userId");
				java.sql.Timestamp orderDate = rs.getTimestamp("orderDate");
				double totalAmount = rs.getDouble("totalAmount");
				String status = rs.getString("status");
				String paymentMethod = rs.getString("paymentMethod");
				int restaurantId = rs.getInt("restaurantId");

				order = new OrderTable(id, userId, orderDate, totalAmount, status, paymentMethod, restaurantId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
		
	}
	
	@Override
	public void updateOrder(OrderTable order) {
		
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY);

			statement.setInt(1, order.getUserId());
			statement.setTimestamp(2, order.getOrderDate());
			statement.setDouble(3, order.getTotalAmount());
			statement.setString(4, order.getStatus());
			statement.setString(5, order.getPaymentMethod());
			statement.setInt(6, order.getRestaurantId());
			statement.setInt(7, order.getOrderId());

			statement.executeUpdate();

			System.out.println("Order Updated Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteOrder(int orderId) {
		
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(DELETE_QUERY);

			statement.setInt(1, orderId);

			statement.executeUpdate();

			System.out.println("Order Deleted Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@Override
	public List<OrderTable> getAllOrders() {
		
		Connection connection = DBConnection.getConnection();

		ArrayList<OrderTable> orderList = new ArrayList<>();

		try {

			Statement statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				int id = rs.getInt("orderId");
				int userId = rs.getInt("userId");
				java.sql.Timestamp orderDate = rs.getTimestamp("orderDate");
				double totalAmount = rs.getDouble("totalAmount");
				String status = rs.getString("status");
				String paymentMethod = rs.getString("paymentMethod");
				int restaurantId = rs.getInt("restaurantId");

				OrderTable order = new OrderTable(id, userId, orderDate, totalAmount, status, paymentMethod, restaurantId);

				orderList.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderList;
		
		
	}
	
	@Override
	public List<OrderTable> getOrdersByUser(int userId) {
		
		Connection connection = DBConnection.getConnection();

		ArrayList<OrderTable> orderList = new ArrayList<>();

		try {

			PreparedStatement statement = connection.prepareStatement(GET_BY_USER_QUERY);

			statement.setInt(1, userId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderId");
				java.sql.Timestamp orderDate = rs.getTimestamp("orderDate");
				double totalAmount = rs.getDouble("totalAmount");
				String status = rs.getString("status");
				String paymentMethod = rs.getString("paymentMethod");
				int restaurantId = rs.getInt("restaurantId");

				OrderTable order = new OrderTable(id, userId, orderDate, totalAmount, status, paymentMethod, restaurantId);

				orderList.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderList;
	}
	

}

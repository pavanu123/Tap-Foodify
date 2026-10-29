package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO orderitem(orderId,quantity,itemTotal,menuId) VALUES(?,?,?,?)";

	private static final String GET_QUERY =
			"SELECT * FROM orderitem WHERE orderItemId=?";

	private static final String UPDATE_QUERY =
			"UPDATE orderitem SET orderId=?, quantity=?, itemTotal=?, menuId=? WHERE orderItemId=?";

	private static final String DELETE_QUERY =
			"DELETE FROM orderitem WHERE orderItemId=?";

	private static final String GET_ALL_QUERY =
			"SELECT * FROM orderitem";

	private static final String GET_BY_ORDER_QUERY =
			"SELECT * FROM orderitem WHERE orderId=?";

	@Override
	public void addOrderItem(OrderItem orderItem) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(INSERT_QUERY);

			statement.setInt(1, orderItem.getOrderId());
			statement.setInt(2, orderItem.getQuantity());
			statement.setDouble(3, orderItem.getItemTotal());
			statement.setInt(4, orderItem.getMenuId());

			statement.executeUpdate();

			System.out.println("Order Item Added Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {

		Connection connection = DBConnection.getConnection();

		OrderItem orderItem = null;

		try {

			PreparedStatement statement = connection.prepareStatement(GET_QUERY);

			statement.setInt(1, orderItemId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderItemId");
				int orderId = rs.getInt("orderId");
				int quantity = rs.getInt("quantity");
				double itemTotal = rs.getDouble("itemTotal");
				int menuId = rs.getInt("menuId");

				orderItem = new OrderItem(id, orderId, quantity, itemTotal, menuId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItem;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY);

			statement.setInt(1, orderItem.getOrderId());
			statement.setInt(2, orderItem.getQuantity());
			statement.setDouble(3, orderItem.getItemTotal());
			statement.setInt(4, orderItem.getMenuId());
			statement.setInt(5, orderItem.getOrderItemId());

			statement.executeUpdate();

			System.out.println("Order Item Updated Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(DELETE_QUERY);

			statement.setInt(1, orderItemId);

			statement.executeUpdate();

			System.out.println("Order Item Deleted Successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		Connection connection = DBConnection.getConnection();

		ArrayList<OrderItem> orderItemList = new ArrayList<>();

		try {

			Statement statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				int id = rs.getInt("orderItemId");
				int orderId = rs.getInt("orderId");
				int quantity = rs.getInt("quantity");
				double itemTotal = rs.getDouble("itemTotal");
				int menuId = rs.getInt("menuId");

				OrderItem orderItem = new OrderItem(id, orderId, quantity, itemTotal, menuId);

				orderItemList.add(orderItem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItemList;
	}

	@Override
	public List<OrderItem> getOrderItemsByOrder(int orderId) {

		Connection connection = DBConnection.getConnection();

		ArrayList<OrderItem> orderItemList = new ArrayList<>();

		try {

			PreparedStatement statement = connection.prepareStatement(GET_BY_ORDER_QUERY);

			statement.setInt(1, orderId);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderItemId");
				int quantity = rs.getInt("quantity");
				double itemTotal = rs.getDouble("itemTotal");
				int menuId = rs.getInt("menuId");

				OrderItem orderItem = new OrderItem(id, orderId, quantity, itemTotal, menuId);

				orderItemList.add(orderItem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItemList;
	}
}
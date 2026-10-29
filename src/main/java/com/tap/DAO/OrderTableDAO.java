package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderTable;

public interface OrderTableDAO {

	// Place a new order
	int addOrder(OrderTable order);

	// Fetch an order using Order ID
	OrderTable getOrder(int orderId);

	// Update order details (status, payment, etc.)
	void updateOrder(OrderTable order);

	// Delete an order
	void deleteOrder(int orderId);

	// Fetch all orders
	List<OrderTable> getAllOrders();

	// Fetch all orders placed by a specific user
	List<OrderTable> getOrdersByUser(int userId);

}
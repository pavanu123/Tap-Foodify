package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {

	// Add an item to an order
	void addOrderItem(OrderItem orderItem);

	// Fetch an order item by its ID
	OrderItem getOrderItem(int orderItemId);

	// Update quantity or item total
	void updateOrderItem(OrderItem orderItem);

	// Remove an item from an order
	void deleteOrderItem(int orderItemId);

	// Fetch all order items
	List<OrderItem> getAllOrderItems();

	// Fetch all items belonging to a particular order
	List<OrderItem> getOrderItemsByOrder(int orderId);

}
package com.tap.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOImp.OrderItemDAOImpl;
import com.tap.DAOImp.OrderTableDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("loggedInUser");
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		double grandTotal = (double)session.getAttribute("grandTotal");
		
		
		if(user!=null) {
			
			
			if(cart!=null && !cart.getItems().isEmpty()) {
				int userId = user.getUserId();
				String paymentMethod = req.getParameter("paymentMethod");
				
				OrderTable orderTable = new OrderTable(userId, new Timestamp(System.currentTimeMillis()), grandTotal, "Pending", paymentMethod, restaurantId);
				OrderTableDAOImpl orderTableDAOImpl = new OrderTableDAOImpl();
				int order = orderTableDAOImpl.addOrder(orderTable);
				
				for(CartItem item: cart.getItems().values()) {
					int menuId = item.getMenuId();
					int quantity = item.getQuantity();
					double price = item.getPrice();
					
					System.out.println("Grand Total in Servlet = " + grandTotal);
					
					OrderItem orderItem = new OrderItem(order, quantity, price, menuId);
					OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
					orderItemDAOImpl.addOrderItem(orderItem);
				}
				resp.sendRedirect("order-item.jsp");
			}	
		}else {
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}

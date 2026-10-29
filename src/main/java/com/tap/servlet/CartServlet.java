package com.tap.servlet;

import java.awt.print.PrinterGraphics;
import java.io.IOException;

import com.tap.DAO.MenuDAO;
import com.tap.DAOImp.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Cart  cart = (Cart)session.getAttribute("cart");

		int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");


		if(cart == null || newRestaurantId != restaurantId) {

			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantId);	
		}


		String action = req.getParameter("action");
		

		if(action.equals("ADD")) {

			addItemToCart(req,cart);

		}else if(action.equals("update")) {
			updateItem(req,cart);
		

		}else if(action.equals("delete")) {

			deleteItem(req,cart);	
		}

		RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
		rd.forward(req, resp);






	}













	private void deleteItem(HttpServletRequest req, Cart cart) {
		
		
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		
		cart.remove(menuId);

		
	}
















	private void updateItem(HttpServletRequest req, Cart cart) {
		
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		
		cart.updateItem(menuId,quantity);
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		Menu menu = menuDAOImpl.getMenu(menuId);

		HttpSession session = req.getSession();
		session.setAttribute("restaurantId", menu.getRestaurantId());

		CartItem cartItem = new CartItem(menu.getMenuId(),
				menu.getRestaurantId(),
				menu.getItemName(),
				menu.getPrice(),
				quantity
				);	
		cart.addItem(cartItem);

	}




}

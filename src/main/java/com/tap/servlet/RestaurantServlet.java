package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImp.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		List<Restaurant> allRestaurants = restaurantDAOImpl.getAllRestaurants();
		
		
		
		req.setAttribute("allRestaurants", allRestaurants);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("restaurant.jsp");
		requestDispatcher.forward(req, resp);
	}

}

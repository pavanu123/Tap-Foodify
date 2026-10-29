package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImp.MenuDAOImpl;
import com.tap.DAOImp.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		
		int id = Integer.parseInt(req.getParameter("restaurantId"));
		
		List<Menu> menuByRestaurant = menuDAOImpl.getMenuByRestaurant(id);
		
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		Restaurant restaurant = restaurantDAOImpl.getRestaurant(id);
		
		for(Menu menu : menuByRestaurant) {
			
			System.out.println(menu);	
		}
		
		req.setAttribute("menuByRestaurant", menuByRestaurant);
		req.setAttribute("Restaurant", restaurant);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("menu.jsp");
		requestDispatcher.forward(req, resp);
		
	}

}

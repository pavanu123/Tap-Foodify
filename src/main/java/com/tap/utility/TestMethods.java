package com.tap.utility;

import java.sql.Timestamp;
import java.util.List;

import com.tap.DAO.*;
import com.tap.DAOImp.*;
import com.tap.DAOImp.UserDAOImp;
import com.tap.model.*;

public class TestMethods {

	public static void main(String[] args) {

		//1.Adduseer User user = new User("Keerthi","keerthi@gmail.com","Keerthi@25","Bengaluru","Admin");

		UserDAOImp userdao = new UserDAOImp();

		//userdao.addUser(user);

		//2.getUser	User user = userdao.getUser(2);
		//	System.out.println(user);


		//3.getalluser	List<User> allUser = userdao.getAllUser();

		//for(User e: allUser) {
		//		System.out.println(e);
		//	}

		//4.updateUser User user = userdao.getUser(2);
		//user.setAddress("Tamilnadu");

		//userdao.updateUser(user);

		//5.delete user userdao.deleteUser(2);

		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		//Resto
		/* 1. add resto

		Restaurant r1 = new Restaurant(
				"KFC",
				"Fast Food",
				30,
				"Bangalore",
				4.5,
				true,
				"kfc.jpg",
				1);

		restaurantDAOImpl.addRestaurant(r1);

		//2.get restaranut
		Restaurant restaurant = restaurantDAOImpl.getRestaurant(1);
		System.out.println(restaurant);


		//3.update
		Restaurant restaurant = restaurantDAOImpl.getRestaurant(1);

		restaurant.setRestaurantName("Meghanas");

		restaurantDAOImpl.updateRestaurant(restaurant);

		//4.		

		restaurantDAOImpl.deleteRestaurant(1);

		//5.getAll restaurant
		List<Restaurant> list = restaurantDAOImpl.getAllRestaurants();

		for(Restaurant r: list) {
			System.out.println(r);
		}
		 */

		MenuDAOImpl dao = new MenuDAOImpl();

		/*	1.add menu	
		 * Menu menu = new Menu(2,"Chicken Burger","Spicy Chicken Burger",199.00,true,"burger.jpg");

		dao.addMenu(menu);


		//2.getMenu
		Menu m = dao.getMenu(3);

		System.out.println(m);


		//3.update menu
		Menu menu = dao.getMenu(3);

		menu.setItemName("Pani Puri");

		dao.updateMenu(menu);


		//5.list menu
		List<Menu> allMenus = dao.getAllMenus();

		for(Menu m: allMenus) {
			System.out.println(m);
		}



		List<Menu> menuByRestaurant = dao.getMenuByRestaurant(2);

		for(Menu item: menuByRestaurant) {
			System.out.println(item);
		}


		 */ 

		OrderTableDAO orderdao = new OrderTableDAOImpl();
		/* 
		 * 1.addOrder
		OrderTable order = new OrderTable(
				1,                              // userId
				new Timestamp(System.currentTimeMillis()),
				450.00,
				"Pending",
				"UPI",
				2                              // restaurantId
		);

		orderdao.addOrder(order);

		 2.getOrder

		OrderTable o = orderdao.getOrder(1);

		System.out.println(o);
		
		3.updateOrder
		
		OrderTable order = orderdao.getOrder(1);
		
		order.setStatus("Delivered");
		
		orderdao.updateOrder(order);
		
		
		4.getorder
		List<OrderTable> list = orderdao.getAllOrders();

		for (OrderTable ord : list) {
			System.out.println(ord);
		}
		
		
		List<OrderTable> userOrders = orderdao.getOrdersByUser(1);

		for (OrderTable ord : userOrders) {
			System.out.println(ord);
		}
	*/
		

		OrderItemDAO item = new OrderItemDAOImpl();
		/*		
		 * 1.addorderitem
		OrderItem orderItem = new OrderItem(
				1,      // orderId
				2,      // quantity
				398.00, // itemTotal
				3       // menuId
		);

		item.addOrderItem(orderItem);
	
		
		2.getOrder
		
		OrderItem orderItem = item.getOrderItem(1);
		
		System.out.println(orderItem);
		
		3.updateOrder
		
		OrderItem updateItem = new OrderItem(
				1,      // orderItemId
				1,      // orderId
				3,      // quantity
				597.00, // itemTotal
				3     // menuId
		);

		item.updateOrderItem(updateItem);
		
		
		4.getAllorder
		List<OrderItem> list = item.getAllOrderItems();

		for (OrderItem oi : list) {
			System.out.println(oi);
		}
		
		5.getorderbyorderid
		List<OrderItem> orderItems = item.getOrderItemsByOrder(1);

		for (OrderItem oi : orderItems) {
			System.out.println(oi);
		}
		
		*/

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}

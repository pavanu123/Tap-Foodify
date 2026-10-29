package com.tap.DAO;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {

	// Insert a new menu item
	void addMenu(Menu menu);

	// Fetch a menu item by Menu ID
	Menu getMenu(int menuId);

	// Update menu details
	void updateMenu(Menu menu);

	// Delete a menu item
	void deleteMenu(int menuId);

	// Fetch all menu items
	List<Menu> getAllMenus();

	// Fetch all menu items of a particular restaurant
	List<Menu> getMenuByRestaurant(int restaurantId);

}
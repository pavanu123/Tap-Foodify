package com.tap.DAO;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {

	// Insert a new restaurant into the database
	void addRestaurant(Restaurant restaurant);

	// Fetch a restaurant using its ID
	Restaurant getRestaurant(int restaurantId);

	// Update restaurant details
	void updateRestaurant(Restaurant restaurant);

	// Delete a restaurant using its ID
	void deleteRestaurant(int restaurantId);

	// Fetch all restaurants
	List<Restaurant> getAllRestaurants();

}

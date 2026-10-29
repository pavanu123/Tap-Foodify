package com.tap.model;

public class Restaurant {
	
	private int restaurantId;
	private String restaurantName;
	private String cuisineType;
	private int deliveryTime;
	private String restaurantaddress;
	private double rating;
	private boolean isActive;
	private String imagePath;
	private int adminId;
	
	public Restaurant() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Restaurant(int restaurantId, String restaurantName, String cuisineType, int deliveryTime,
			String restaurantaddress, double rating, boolean isActive, String imagePath, int adminId) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.restaurantaddress = restaurantaddress;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
		this.adminId = adminId;
	}
	
	
	public Restaurant(String restaurantName, String cuisineType, int deliveryTime, String restaurantaddress,
			double rating, boolean isActive, String imagePath, int adminId) {
		super();
		this.restaurantName = restaurantName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.restaurantaddress = restaurantaddress;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
		this.adminId = adminId;
	}


	public int getRestaurantId() {
		return restaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	public String getRestaurantName() {
		return restaurantName;
	}


	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}


	public String getCuisineType() {
		return cuisineType;
	}


	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}


	public int getDeliveryTime() {
		return deliveryTime;
	}


	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}


	public String getRestaurantaddress() {
		return restaurantaddress;
	}


	public void setRestaurantaddress(String restaurantaddress) {
		this.restaurantaddress = restaurantaddress;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public boolean isActive() {
		return isActive;
	}


	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public int getAdminId() {
		return adminId;
	}


	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}


	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", cuisineType="
				+ cuisineType + ", deliveryTime=" + deliveryTime + ", restaurantaddress=" + restaurantaddress
				+ ", rating=" + rating + ", isActive=" + isActive + ", imagePath=" + imagePath + ", adminId=" + adminId
				+ "]";
	}
	
	
	

}

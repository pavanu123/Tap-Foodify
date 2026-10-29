
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List ,com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Browse premium Bangalore dining options on Bengaluru Feasts.">
<title>RESTAURANTS IN BANGALORE — BENGALURU FEASTS</title>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Oswald:wght@500;700;900&display=swap"
	rel="stylesheet">
<style>
:root {
	--velvet-wine: #260212;
	--burgundy-stage: #4f0423;
	--impossible-red: #e10600;
	--blush-highlight: #ffc7c6;
	--black: #000000;
	--white: #ffffff;
	--spacing-4: 4px;
	--spacing-8: 8px;
	--spacing-12: 12px;
	--spacing-16: 16px;
	--spacing-20: 20px;
	--spacing-24: 24px;
	--spacing-32: 32px;
	--spacing-40: 40px;
	--spacing-56: 56px;
	--radius-nav: 15px;
	--radius-cards: 12px;
	--radius-buttons: 15px;
	--radius-toggles: 15px;
	--font-display: 'Oswald', 'Arial Black', sans-serif;
	--font-sans: 'Inter', sans-serif;
	--transition: all 0.2s ease-out;
	--max-width: 1280px;
}

*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: var(--velvet-wine);
	color: var(--white);
	font-family: var(--font-sans);
	line-height: 1.5;
	-webkit-font-smoothing: antialiased;
}

a {
	text-decoration: none;
	color: inherit;
	transition: var(--transition);
}

.container {
	max-width: var(--max-width);
	margin: 0 auto;
	padding: 0 var(--spacing-24);
}

/* ====== NAVBAR ====== */
.navbar {
	position: sticky;
	top: 0;
	z-index: 1000;
	background-color: var(--black);
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
	height: 72px;
}

.nav-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 100%;
}

.nav-logo {
	font-family: var(--font-display);
	font-size: 22px;
	font-weight: 900;
	color: var(--impossible-red);
	letter-spacing: 2px;
	text-transform: uppercase;
}

.nav-logo span {
	color: var(--white);
}

.nav-menu {
	display: flex;
	align-items: center;
	gap: var(--spacing-32);
}

.nav-link {
	font-family: var(--font-display);
	font-size: 15px;
	font-weight: 700;
	color: var(--white);
	text-transform: uppercase;
	letter-spacing: 1px;
	display: flex;
	align-items: center;
	gap: 4px;
}

.nav-link::after {
	content: '▾';
	font-size: 11px;
	color: var(--blush-highlight);
}

.nav-link.no-caret::after {
	display: none;
}

.nav-link:hover, .nav-link.active {
	color: var(--impossible-red);
}

.nav-actions {
	display: flex;
	align-items: center;
	gap: var(--spacing-16);
}

.btn-primary {
	background-color: var(--impossible-red);
	color: var(--white);
	font-family: var(--font-display);
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.05em;
	border: none;
	border-radius: var(--radius-buttons);
	padding: 10px 18px;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	cursor: pointer;
	transition: var(--transition);
}

.btn-primary:hover {
	opacity: 0.9;
}

.btn-ghost {
	background: transparent;
	color: var(--white);
	border: 1.5px solid var(--white);
	font-family: var(--font-display);
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.05em;
	border-radius: var(--radius-buttons);
	padding: 10px 18px;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	cursor: pointer;
	transition: var(--transition);
}

.btn-ghost:hover {
	background-color: rgba(255, 255, 255, 0.08);
	border-color: var(--impossible-red);
}

.cart-btn {
	position: relative;
}

.cart-badge {
	position: absolute;
	top: -6px;
	right: -8px;
	background-color: var(--white);
	color: var(--black);
	font-family: var(--font-display);
	font-size: 11px;
	font-weight: 900;
	min-width: 18px;
	height: 18px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Hamburger */
.nav-toggle {
	display: none;
}

.nav-toggle-label {
	display: none;
	flex-direction: column;
	gap: 4px;
	cursor: pointer;
}

.nav-toggle-label span {
	width: 20px;
	height: 2px;
	background-color: var(--white);
}

.nav-menu-mobile {
	display: none;
	position: absolute;
	top: 72px;
	left: 0;
	right: 0;
	background-color: var(--black);
	border-bottom: 1.5px solid var(--impossible-red);
	flex-direction: column;
	padding: var(--spacing-24);
	gap: var(--spacing-16);
	z-index: 999;
}

.nav-menu-mobile a {
	font-family: var(--font-display);
	font-size: 16px;
	font-weight: 700;
	color: var(--white);
	text-transform: uppercase;
	letter-spacing: 1px;
}

/* ====== BREADCRUMBS & HEADER ====== */
.page-header {
	padding: var(--spacing-40) 0 var(--spacing-24);
}

.breadcrumb {
	display: flex;
	align-items: center;
	gap: var(--spacing-8);
	font-size: 13px;
	color: var(--blush-highlight);
	margin-bottom: var(--spacing-12);
}

.breadcrumb a:hover {
	color: var(--white);
}

.breadcrumb span.separator {
	color: var(--impossible-red);
}

.page-title {
	font-family: var(--font-display);
	font-size: 48px;
	font-weight: 900;
	color: var(--white);
	text-transform: uppercase;
	letter-spacing: 1px;
	line-height: 1;
}

.page-title span {
	color: var(--impossible-red);
}

.page-subtitle {
	font-size: 14px;
	color: var(--blush-highlight);
	margin-top: var(--spacing-8);
}

/* ====== SEARCH & FILTERS ====== */
.search-filter-section {
	padding-bottom: var(--spacing-40);
}

.search-block {
	display: flex;
	align-items: center;
	background-color: var(--black);
	border: 1px solid var(--impossible-red);
	border-radius: var(--radius-buttons);
	padding: 6px;
	max-width: 100%;
	margin-bottom: var(--spacing-20);
}

.search-icon-label {
	padding: 0 var(--spacing-16);
	font-family: var(--font-display);
	font-size: 16px;
	color: var(--blush-highlight);
	font-weight: 700;
}

.search-input-wrap {
	flex: 1;
}

.search-input-wrap input {
	width: 100%;
	background: transparent;
	border: none;
	outline: none;
	color: var(--white);
	font-family: var(--font-sans);
	font-size: 15px;
	padding: 8px 0;
}

.search-input-wrap input::placeholder {
	color: rgba(255, 255, 255, 0.4);
}

.filter-toggles {
	display: flex;
	gap: var(--spacing-12);
	overflow-x: auto;
	padding-bottom: var(--spacing-8);
	scrollbar-width: none;
}

.filter-toggles::-webkit-scrollbar {
	display: none;
}

.filter-pill {
	flex-shrink: 0;
	font-family: var(--font-display);
	font-size: 13px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.05em;
	padding: 10px 18px;
	background-color: transparent;
	border: 1px solid rgba(255, 255, 255, 0.15);
	color: var(--blush-highlight);
	border-radius: var(--radius-toggles);
	cursor: pointer;
	transition: var(--transition);
}

.filter-pill:hover {
	border-color: var(--impossible-red);
	color: var(--white);
}

.filter-pill.active {
	background-color: var(--impossible-red);
	border-color: var(--impossible-red);
	color: var(--white);
}

/* ====== RESTAURANT GRID ====== */
.restaurant-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: var(--spacing-32);
	padding-bottom: var(--spacing-56);
}

.rest-card {
	background-color: var(--burgundy-stage);
	border: 1px solid var(--black);
	border-radius: var(--radius-cards);
	overflow: hidden;
	transition: var(--transition);
	display: flex;
	flex-direction: column;
}

.rest-card:hover {
	border-color: var(--impossible-red);
}

.rest-img-block {
	width: 100%;
	height: 230px;      /* Changed from 200px */
	overflow: hidden;
	position: relative;
}

.rest-img-block img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
	display: block;
}

.offer-ribbon {
	position: absolute;
	top: var(--spacing-12);
	left: var(--spacing-12);
	background-color: var(--impossible-red);
	color: var(--white);
	font-family: var(--font-display);
	font-size: 12px;
	font-weight: 700;
	padding: var(--spacing-4) var(--spacing-12);
	border-radius: 4px;
	text-transform: uppercase;
	letter-spacing: 0.05em;
}

.fav-btn {
	position: absolute;
	top: var(--spacing-12);
	right: var(--spacing-12);
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-color: var(--black);
	border: 1px solid rgba(255, 255, 255, 0.15);
	color: var(--white);
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	font-weight: 700;
	transition: var(--transition);
}

.fav-btn:hover {
	border-color: var(--impossible-red);
	color: var(--impossible-red);
}

.delivery-time {
	position: absolute;
	bottom: var(--spacing-12);
	right: var(--spacing-12);
	background-color: var(--black);
	color: var(--white);
	font-family: var(--font-display);
	font-size: 11px;
	font-weight: 700;
	padding: var(--spacing-4) var(--spacing-12);
	border-radius: var(--radius-toggles);
	border: 1px solid rgba(255, 255, 255, 0.15);
}

.rest-body {
	padding: var(--spacing-24);
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.rest-title-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: var(--spacing-8);
}

.rest-title {
	font-family: var(--font-display);
	font-size: 22px;
	font-weight: 900;
	color: var(--white);
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.rest-rating {
	background-color: var(--impossible-red);
	color: var(--white);
	font-family: var(--font-display);
	font-size: 13px;
	font-weight: 700;
	padding: 2px 8px;
	border-radius: 4px;
	display: flex;
	align-items: center;
	gap: 2px;
}

.rest-cuisines {
	font-size: 13px;
	color: var(--blush-highlight);
	margin-bottom: var(--spacing-24);
}

.rest-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: var(--spacing-16);
	border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.rest-price-info {
	font-family: var(--font-display);
	font-size: 13px;
	font-weight: 700;
	color: var(--white);
	letter-spacing: 0.5px;
}

/* ====== PAGINATION ====== */
.pagination-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: var(--spacing-8);
	padding: var(--spacing-24) 0 var(--spacing-80);
}

.page-btn {
	font-family: var(--font-display);
	font-size: 14px;
	font-weight: 700;
	color: var(--blush-highlight);
	border: 1px solid rgba(255, 255, 255, 0.15);
	background-color: transparent;
	padding: 10px 18px;
	border-radius: var(--radius-toggles);
	cursor: pointer;
	transition: var(--transition);
}

.page-btn:hover {
	border-color: var(--impossible-red);
	color: var(--white);
}

.page-btn.active {
	background-color: var(--impossible-red);
	border-color: var(--impossible-red);
	color: var(--white);
}

/* ====== PREMIUM FOOTER ====== */
.footer {
	background-color: var(--black);
	padding: var(--spacing-80) 0 var(--spacing-40);
	border-top: 1.5px solid var(--impossible-red);
}

.footer-grid {
	display: grid;
	grid-template-columns: 2fr 1fr 1fr 1.5fr;
	gap: var(--spacing-40);
	margin-bottom: var(--spacing-56);
}

.footer-col h3 {
	font-family: var(--font-display);
	font-size: 16px;
	font-weight: 700;
	color: var(--impossible-red);
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-bottom: var(--spacing-24);
}

.footer-logo {
	font-family: var(--font-display);
	font-size: 26px;
	font-weight: 900;
	color: var(--impossible-red);
	letter-spacing: 2px;
	margin-bottom: var(--spacing-16);
	text-transform: uppercase;
}

.footer-about-text {
	font-size: 13px;
	color: var(--blush-highlight);
	margin-bottom: var(--spacing-24);
	line-height: 1.7;
}

.footer-socials {
	display: flex;
	gap: var(--spacing-12);
}

.social-btn-round {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background-color: var(--burgundy-stage);
	border: 1px solid rgba(255, 255, 255, 0.1);
	color: var(--white);
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 700;
	transition: var(--transition);
}

.social-btn-round:hover {
	background-color: var(--impossible-red);
	border-color: var(--impossible-red);
}

.footer-links-list li {
	margin-bottom: var(--spacing-12);
}

.footer-links-list a {
	font-size: 14px;
	color: var(--blush-highlight);
}

.footer-links-list a:hover {
	color: var(--white);
	padding-left: 4px;
}

.newsletter-form {
	display: flex;
	flex-direction: column;
	gap: var(--spacing-12);
}

.newsletter-desc {
	font-size: 13px;
	color: var(--blush-highlight);
}

.newsletter-input-group {
	display: flex;
	border: 1.5px solid var(--burgundy-stage);
	border-radius: var(--radius-buttons);
	overflow: hidden;
}

.newsletter-input-group input {
	flex: 1;
	background-color: rgba(255, 255, 255, 0.05);
	border: none;
	outline: none;
	padding: 12px var(--spacing-16);
	color: var(--white);
	font-family: var(--font-sans);
}

.newsletter-input-group button {
	background-color: var(--impossible-red);
	border: none;
	color: var(--white);
	font-family: var(--font-display);
	font-size: 13px;
	font-weight: 700;
	padding: 0 16px;
	cursor: pointer;
	text-transform: uppercase;
}

.footer-bottom {
	text-align: center;
	padding-top: var(--spacing-32);
	border-top: 1px solid rgba(255, 255, 255, 0.08);
	font-size: 12px;
	color: var(--blush-highlight);
}

/* ====== RESPONSIVE LAYOUT ====== */
@media ( max-width : 1024px) {
	.restaurant-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.footer-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.nav-menu {
		display: none;
	}
	.nav-toggle-label {
		display: flex;
	}
	.nav-toggle:checked ~ .nav-menu-mobile {
		display: flex;
	}
	.restaurant-grid {
		grid-template-columns: 1fr;
	}
	.footer-grid {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>

	<!-- NAVBAR -->
	<nav class="navbar">
		<div class="container nav-inner">
			<a href="index.jsp" class="nav-logo">BENGALURU <span>FEASTS</span></a>

			<!-- Desktop Menu -->
			<ul class="nav-menu">
				<li><a href="index.jsp" class="nav-link">Home</a></li>
				<li><a href="restaurant" class="nav-link active">Restaurants</a></li>
				<li><a href="#" class="nav-link">Collections</a></li>
				<li><a href="profile.jsp" class="nav-link no-caret">Profile</a></li>
			</ul>

			<div class="nav-actions">
				<a href="cart.jsp" class="btn-ghost cart-btn no-caret">
					&#128092; CART <span class="cart-badge">3</span>
				</a> <a href="login.jsp" class="btn-primary">LOGIN ▸</a>

				<!-- Toggle button for mobile -->
				<input type="checkbox" id="nav-toggle-check" class="nav-toggle">
				<label for="nav-toggle-check" class="nav-toggle-label"> <span></span>
					<span></span> <span></span>
				</label>

				<!-- Mobile Dropdown Menu -->
				<div class="nav-menu-mobile">
					<a href="index.jsp">Home</a> <a href="restaurant">Restaurants</a>
					<a href="#">Collections</a> <a href="profile.jsp">Profile</a>
				</div>
			</div>
		</div>
	</nav>


<%
             List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
			%>


	<!-- BREADCRUMBS & PAGE HEADER -->
	<header class="container">
		<div class="page-header">
			<div class="breadcrumb">
				<a href="index.jsp">Home</a> <span class="separator">/</span> <span>Restaurants</span>
			</div>
			<h1 class="page-title">
				ORDER <span>FROM RESTAURANTS</span>
			</h1>
			<p class="page-subtitle">Showing <%=allRestaurants.size() %> legendary Bangalore dining
				institutions in Bangalore, Karnataka.</p>
		</div>
	</header>

	<!-- SEARCH & FILTER SYSTEM -->
	<section class="container search-filter-section">
		<form class="search-block" action="#">
			<span class="search-icon-label">&#128269;</span>
			<div class="search-input-wrap">
				<input type="text"
					placeholder="Search by restaurant name, cuisine or dish (e.g. Nagarjuna, MTR dosa)..."
					aria-label="Search restaurants">
			</div>
			<button type="submit" class="btn-primary">SEARCH ▸</button>
		</form>

		<div class="filter-toggles">
			<button class="filter-pill active">All Cuisines</button>
			<button class="filter-pill">South Indian</button>
			<button class="filter-pill">Andhra Style</button>
			<button class="filter-pill">Burgers &amp; Cafe</button>
			<button class="filter-pill">Pizza &amp; Italian</button>
			<button class="filter-pill">Desserts &amp; Bakery</button>
			<button class="filter-pill">Late Night</button>
		</div>
	</section>

	<!-- RESTAURANTS GRID -->
	<main class="container">
		<div class="restaurant-grid">
			<!-- 1. MTR -->

			<% 
			 for (Restaurant restaurant : allRestaurants) {
			%>
			<div class="rest-card">
				<div class="rest-img-block">
					<img src="<%= restaurant.getImagePath()%>"alt="Mavalli Tiffin Room"> 
					<span class="offer-ribbon">NO DELIVERY FEE</span> 
						<span class="fav-btn">&#9825;</span> 
						<span class="delivery-time"><%=restaurant.getDeliveryTime() %> MINS</span>
				</div>
				<div class="rest-body">
					<div class="rest-title-row">
						<h3 class="rest-title"><%= restaurant.getRestaurantName() %></h3>
						<span class="rest-rating">★ <%=restaurant.getRating() %></span>
					</div>
					<p class="rest-cuisines"><%= restaurant.getCuisineType() %>></p>
					<div class="rest-footer">
						<span class="rest-price-info"><%=restaurant.getRestaurantaddress() %></span> 
						<a href="menu?restaurantId=<%=restaurant.getRestaurantId() %>" class="btn-ghost">VIEW MENU ▸</a>
					</div>
				</div>
			</div>

		<% 			
		}

%>

		</div>
		<!-- PAGINATION -->
		<div class="pagination-wrap">
			<button class="page-btn">PREV</button>
			<button class="page-btn active">1</button>
			<button class="page-btn">2</button>
			<button class="page-btn">3</button>
			<button class="page-btn">NEXT</button>
		</div>
	</main>

	<!-- PREMIUM FOOTER -->
	<footer class="footer">
		<div class="container">
			<div class="footer-grid">
				<div class="footer-col">
					<div class="footer-logo">
						BENGALURU <span>FEASTS</span>
					</div>
					<p class="footer-about-text">Experience the iconic taste of
						Bangalore. We deliver heritage dishes and modern cafe classics
						from the city's legendary food lanes directly to your table at
						bold speed.</p>
					<div class="footer-socials">
						<a href="#" class="social-btn-round">F</a> <a href="#"
							class="social-btn-round">T</a> <a href="#"
							class="social-btn-round">I</a>
					</div>
				</div>

				<div class="footer-col">
					<h3>QUICK LINKS</h3>
					<ul class="footer-links-list">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="restaurant">All Restaurants</a></li>
						<li><a href="#">Exclusive Offers</a></li>
						<li><a href="profile.jsp">My Profile</a></li>
					</ul>
				</div>

				<div class="footer-col">
					<h3>ICONIC CUISINES</h3>
					<ul class="footer-links-list">
						<li><a href="restaurant">South Indian</a></li>
						<li><a href="restaurant">Andhra Style</a></li>
						<li><a href="restaurant">Cafe Burgers</a></li>
						<li><a href="restaurant">Corner Desserts</a></li>
					</ul>
				</div>

				<div class="footer-col">
					<h3>STAY BOLD</h3>
					<div class="newsletter-form">
						<p class="newsletter-desc">Subscribe to unlock secret coupons
							and new legendary restaurant openings.</p>
						<div class="newsletter-input-group">
							<input type="email" placeholder="Enter your email"
								aria-label="Email Address">
							<button type="button">JOIN</button>
						</div>
					</div>
				</div>
			</div>

			<div class="footer-bottom">&copy; 2026 BENGALURU FEASTS.
				Designed in accordance with Refero style guide. Flat dark design.</div>
		</div>
	</footer>

</body>
</html>

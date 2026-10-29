<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List,com.tap.model.Menu,com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="View restaurant menus and order food online on Bengaluru Feasts.">
  <title>RESTAURANT MENU â BENGALURU FEASTS</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Oswald:wght@500;700;900&display=swap" rel="stylesheet">
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
      content: 'â¾';
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

    /* Hamburger Hack */
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

    /* ====== RESTAURANT BANNER & DETAILS ====== */
    .restaurant-detail-banner {
      background-color: var(--burgundy-stage);
      border-bottom: 1px solid var(--black);
      padding: var(--spacing-40) 0;
      position: relative;
    }

    .rest-detail-inner {
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      gap: var(--spacing-24);
    }

    .rest-detail-info h1 {
      font-family: var(--font-display);
      font-size: 48px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      line-height: 1;
      margin-bottom: var(--spacing-8);
    }

    .rest-detail-cuisines {
      font-size: 15px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    .rest-detail-meta {
      display: flex;
      gap: var(--spacing-24);
      flex-wrap: wrap;
    }

    .meta-box {
      display: flex;
      flex-direction: column;
    }

    .meta-lbl {
      font-size: 11px;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 2px;
    }

    .meta-val {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      color: var(--white);
    }

    .rest-rating-box {
      background-color: var(--impossible-red);
      border-radius: var(--radius-cards);
      padding: var(--spacing-16) var(--spacing-24);
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .rating-big {
      font-family: var(--font-display);
      font-size: 32px;
      font-weight: 900;
      color: var(--white);
      line-height: 1;
    }

    .rating-sub {
      font-size: 11px;
      color: var(--blush-highlight);
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-top: 4px;
    }

    /* ====== MENU LAYOUT ====== */
    .menu-layout {
      display: grid;
      grid-template-columns: 240px 1fr;
      gap: var(--spacing-40);
      padding: var(--spacing-40) 0 var(--spacing-100);
      align-items: start;
    }

    /* Sidebar list */
    .menu-sidebar {
      position: sticky;
      top: 112px;
    }

    .sidebar-list {
      display: flex;
      flex-direction: column;
      gap: var(--spacing-8);
    }

    .sidebar-item {
      font-family: var(--font-display);
      font-size: 15px;
      font-weight: 700;
      text-transform: uppercase;
      color: var(--blush-highlight);
      letter-spacing: 1px;
      padding: 12px 16px;
      border-left: 2px solid transparent;
      transition: var(--transition);
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .sidebar-item:hover, .sidebar-item.active {
      color: var(--white);
      border-left-color: var(--impossible-red);
      background-color: rgba(255, 255, 255, 0.03);
    }

    .sidebar-badge {
      font-family: var(--font-display);
      font-size: 11px;
      background-color: var(--impossible-red);
      color: var(--white);
      padding: 2px 6px;
      border-radius: 4px;
    }

    /* Category list */
    .menu-category-section {
      margin-bottom: var(--spacing-56);
    }

    .category-title {
      font-family: var(--font-display);
      font-size: 28px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      border-bottom: 2px solid var(--burgundy-stage);
      padding-bottom: var(--spacing-8);
      margin-bottom: var(--spacing-24);
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
    }

    .category-title span {
      font-size: 14px;
      font-family: var(--font-sans);
      color: var(--blush-highlight);
      font-weight: 400;
      text-transform: none;
    }

    /* Food Cards */
    .menu-item-row {
      display: grid;
      grid-template-columns: 1fr;
      gap: var(--spacing-24);
    }

    .food-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-24);
      display: flex;
      gap: var(--spacing-24);
      transition: var(--transition);
    }

    .food-card:hover {
      border-color: var(--impossible-red);
    }

    .food-details {
      flex: 1;
    }

    /* Veg/Non-Veg Badges */
    .food-type-badge {
      width: 16px;
      height: 16px;
      border: 2.5px solid var(--success);
      border-radius: 3px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      margin-bottom: var(--spacing-8);
    }

    .food-type-badge::after {
      content: '';
      width: 7px;
      height: 7px;
      background-color: var(--success);
      border-radius: 50%;
    }

    .food-type-badge.nonveg {
      border-color: var(--impossible-red);
    }

    .food-type-badge.nonveg::after {
      background-color: var(--impossible-red);
      width: 0;
      height: 0;
      border-left: 3.5px solid transparent;
      border-right: 3.5px solid transparent;
      border-bottom: 7px solid var(--impossible-red);
      border-radius: 0;
    }

    /* Bestseller styling */
    .bestseller-label {
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 10px;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: 4px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      display: inline-block;
      margin-left: var(--spacing-8);
      vertical-align: middle;
    }

    .food-name {
      font-family: var(--font-display);
      font-size: 20px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: var(--spacing-4);
    }

    .food-price {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      color: var(--white);
      margin-bottom: var(--spacing-8);
    }

    .food-desc {
      font-size: 13px;
      color: var(--blush-highlight);
      line-height: 1.5;
    }

    .food-img-wrap {
      position: relative;
      width: 120px;
      height: 120px;
      flex-shrink: 0;
    }

    .food-img-holder {
      width: 100%;
      height: 100%;
      background-color: var(--black);
      border-radius: var(--radius-cards);
      overflow: hidden;
      clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
    }

    .food-img-holder img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .btn-add {
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      text-transform: uppercase;
      border: none;
      border-radius: 8px;
      padding: 6px 20px;
      cursor: pointer;
      box-shadow: 0 4px 12px rgba(225, 6, 0, 0.35);
      transition: var(--transition);
    }

    .btn-add:hover {
      background-color: var(--white);
      color: var(--impossible-red);
    }

    .food-customizable {
      position: absolute;
      bottom: -28px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 10px;
      color: var(--blush-highlight);
      text-transform: uppercase;
      white-space: nowrap;
      letter-spacing: 0.5px;
    }

    /* ====== FLOATING CART STRIP ====== */
    .floating-cart-strip {
      position: fixed;
      bottom: 24px;
      left: 50%;
      transform: translateX(-50%);
      width: 90%;
      max-width: 600px;
      background-color: var(--black);
      border: 1.5px solid var(--impossible-red);
      border-radius: var(--radius-buttons);
      padding: var(--spacing-16) var(--spacing-24);
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 999;
      box-shadow: 0 16px 32px rgba(0,0,0,0.5);
    }

    .cart-strip-left {
      display: flex;
      flex-direction: column;
    }

    .cart-strip-items {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .cart-strip-rest {
      font-size: 11px;
      color: var(--blush-highlight);
    }

    .cart-strip-right {
      display: flex;
      align-items: center;
      gap: var(--spacing-8);
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    /* ====== STATE CONTROL FOR 12 RESTAURANT MENUS ====== */
    /* By default show MTR (#mtr) and hide others */
    .restaurant-container {
      display: none;
    }

    #mtr {
      display: block;
    }

    /* Hide MTR menu if any other restaurant menu is targeted in URL hash */
    body:has(#vidyarthi-bhavan:target) #mtr,
    body:has(#nagarjuna:target) #mtr,
    body:has(#truffles:target) #mtr,
    body:has(#corner-house:target) #mtr,
    body:has(#glens:target) #mtr,
    body:has(#ctr:target) #mtr,
    body:has(#empire:target) #mtr,
    body:has(#meghana:target) #mtr,
    body:has(#toit:target) #mtr,
    body:has(#koshys:target) #mtr,
    body:has(#sly-granny:target) #mtr {
      display: none !important;
    }

    /* Show targeted menus */
    #vidyarthi-bhavan:target,
    #nagarjuna:target,
    #truffles:target,
    #corner-house:target,
    #glens:target,
    #ctr:target,
    #empire:target,
    #meghana:target,
    #toit:target,
    #koshys:target,
    #sly-granny:target {
      display: block !important;
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

    @media (max-width: 1024px) {
      .footer-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    @media (max-width: 768px) {
      .nav-menu {
        display: none;
      }
      .nav-toggle-label {
        display: flex;
      }
      .nav-toggle:checked ~ .nav-menu-mobile {
        display: flex;
      }
      .rest-detail-inner {
        flex-direction: column;
        align-items: flex-start;
        gap: var(--spacing-16);
      }
      .rest-rating-box {
        align-self: flex-start;
      }
      .menu-layout {
        grid-template-columns: 1fr;
        gap: var(--spacing-24);
      }
      .menu-sidebar {
        position: static;
        margin-bottom: var(--spacing-16);
      }
      .sidebar-list {
        flex-direction: row;
        overflow-x: auto;
        padding-bottom: var(--spacing-8);
      }
      .sidebar-item {
        border-left: none;
        border-bottom: 2px solid transparent;
        white-space: nowrap;
        padding: 10px 16px;
      }
      .sidebar-item:hover, .sidebar-item.active {
        border-bottom-color: var(--impossible-red);
      }
      .food-card {
        flex-direction: column-reverse;
      }
      .food-img-wrap {
        align-self: center;
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
          &#128092; CART
          <span class="cart-badge">3</span>
        </a>
        <a href="login.jsp" class="btn-primary">LOGIN â¸</a>
        
        <!-- Toggle button for mobile -->
        <input type="checkbox" id="nav-toggle-check" class="nav-toggle">
        <label for="nav-toggle-check" class="nav-toggle-label">
          <span></span>
          <span></span>
          <span></span>
        </label>
        
        <!-- Mobile Dropdown Menu -->
        <div class="nav-menu-mobile">
          <a href="index.jsp">Home</a>
          <a href="restaurant">Restaurants</a>
          <a href="#">Collections</a>
          <a href="profile.jsp">Profile</a>
        </div>
      </div>
    </div>
  </nav>



<% Restaurant restaurant = (Restaurant)request.getAttribute("Restaurant");%>
 

  <!-- ==================== 1. MAVALLI TIFFIN ROOM (MTR) ==================== -->
  <div id= "mtr" class="restaurant-container">
    <section class="restaurant-detail-banner">
      <div class="container rest-detail-inner">
        <div class="rest-detail-info">
          <h1><%= restaurant.getRestaurantName() %></h1>
          <p class="rest-detail-cuisines"><%=restaurant.getCuisineType() %></p>
          <div class="rest-detail-meta">
            <div class="meta-box"><span class="meta-lbl">DELIVERY SPEED</span><span class="meta-val"><%=restaurant.getDeliveryTime() %>MINS</span></div>
            <div class="meta-box"><span class="meta-lbl">AVERAGE COST</span><span class="meta-val">â¹250 FOR TWO</span></div>
            <div class="meta-box"><span class="meta-lbl">LOCATION</span><span class="meta-val"><%=restaurant.getRestaurantaddress() %></span></div>
          </div>
        </div>
        <div class="rest-rating-box"><span class="rating-big">★ <%=restaurant.getRating() %></span><span class="rating-sub">2,500+ RATINGS</span></div>
      </div>
    </section>

    <main class="container menu-layout">
      <aside class="menu-sidebar">
        <ul class="sidebar-list">
          <li><a href="#mtr" class="sidebar-item active">MTR Recommended <span class="sidebar-badge">3</span></a></li>
        </ul>
      </aside>
      <section class="menu-content">
        <div class="menu-category-section">
          <h2 class="category-title">MTR RECOMMENDED <span>(3 ITEMS)</span></h2>
          <div class="menu-item-row">
          
          
        		
          <%
          List<Menu> allRestaurants = (List<Menu>) request.getAttribute("menuByRestaurant"); 
          	
        		for(Menu menu : allRestaurants){
        	%>
        			
        			<div class="food-card">
                    <div class="food-details">
                      <div class="food-type-badge"></div>
                      <span class="bestseller-label">â BESTSELLER</span>
                      <h3 class="food-name"><%=menu.getItemName() %></h3>
                      <div class="food-price">₹<%=menu.getPrice() %></div>
                      <p class="food-desc"><%=menu.getDescription() %></p>
                    </div>
                    <div class="food-img-wrap">
                      <div class="food-img-holder"><img src="assets/images/food/rava_idli.jpg" alt="Rava Idli"></div>
                      
                      
                      <form action="CartServlet" method=post>
                      
                      <input type=hidden name=menuId value=<%=menu.getMenuId() %>>
                      <input type=hidden name=restaurantId value=<%=menu.getRestaurantId() %>>
                      <input type=hidden name=quantity value=1>
                      <input type=submit value="ADD" class="btn-add" name=action>
                      </form>
                    </div>
                  </div>
        	<%
        		}
        		
        		%>
          
          
          
          
            
            
          </div>
        </div>
      </section>
    </main>
  </div>


  <!-- FLOATING CART STRIP -->
  <div class="floating-cart-strip">
    <div class="cart-strip-left">
      <span class="cart-strip-items">3 ITEMS | â¹315</span>
      <span class="cart-strip-rest">PREPARED FRESH TO ORDER</span>
    </div>
    <a href="cart.jsp" class="cart-strip-right">
      VIEW CART â¸
    </a>
  </div>

  <!-- PREMIUM FOOTER -->
  <footer class="footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-col">
          <div class="footer-logo">BENGALURU <span>FEASTS</span></div>
          <p class="footer-about-text">Experience the iconic taste of Bangalore. We deliver heritage dishes and modern cafe classics from the city's legendary food lanes directly to your table at bold speed.</p>
          <div class="footer-socials">
            <a href="#" class="social-btn-round">F</a>
            <a href="#" class="social-btn-round">T</a>
            <a href="#" class="social-btn-round">I</a>
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
            <p class="newsletter-desc">Subscribe to unlock secret coupons and new legendary restaurant openings.</p>
            <div class="newsletter-input-group">
              <input type="email" placeholder="Enter your email" aria-label="Email Address">
              <button type="button">JOIN</button>
            </div>
          </div>
        </div>
      </div>

      <div class="footer-bottom">
        &copy; 2026 BENGALURU FEASTS. Designed in accordance with Refero style guide. Flat dark design.
      </div>
    </div>
  </footer>

</body>
</html>

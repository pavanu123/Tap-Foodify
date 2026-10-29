<%@page import="com.tap.DAOImp.MenuDAOImpl"%>
<%@page import="com.tap.DAOImp.RestaurantDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="com.tap.model.CartItem,com.tap.model.Cart,com.tap.model.Restaurant,com.tap.DAOImp.RestaurantDAOImpl,com.tap.model.Menu,com.tap.DAOImp.MenuDAOImpl"%>
    


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Review your cart items and place your order on Bengaluru Feasts.">
  <title>YOUR CART — BENGALURU FEASTS</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" >
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

    /* ====== HEADER ====== */
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

    /* ====== CART LAYOUT ====== */
    .cart-layout {
      display: grid;
      grid-template-columns: 1fr 400px;
      gap: var(--spacing-32);
      padding-bottom: var(--spacing-80);
      align-items: start;
    }

    .cart-items-section {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
    }

    .cart-section-title {
      font-family: var(--font-display);
      font-size: 24px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      border-bottom: 2px solid var(--velvet-wine);
      padding-bottom: var(--spacing-12);
      margin-bottom: var(--spacing-12);
    }

    .cart-item {
      display: flex;
      align-items: center;
      gap: var(--spacing-16);
      padding: var(--spacing-20) 0;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    .cart-item:last-child {
      border-bottom: none;
    }

    /* Veg Badge */
    .veg-indicator {
      width: 14px;
      height: 14px;
      border: 2px solid var(--success);
      border-radius: 3px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .veg-indicator::after {
      content: '';
      width: 6px;
      height: 6px;
      background-color: var(--success);
      border-radius: 50%;
    }

    .cart-item-name-wrap {
      flex: 1;
    }

    .cart-item-name {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
    }

    .cart-item-desc {
      font-size: 11px;
      color: var(--blush-highlight);
    }

    .qty-controls {
      display: flex;
      align-items: center;
      border: 1.5px solid rgba(255, 255, 255, 0.15);
      border-radius: var(--radius-toggles);
      overflow: hidden;
      background-color: var(--black);
    }

    .qty-btn {
      background: transparent;
      border: none;
      color: var(--white);
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      width: 32px;
      height: 32px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: var(--transition);
    }

    .qty-btn:hover {
      background-color: var(--burgundy-stage);
      color: var(--impossible-red);
    }

    .qty-value {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--white);
      width: 24px;
      text-align: center;
    }

    .cart-item-price {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      color: var(--white);
      width: 80px;
      text-align: right;
    }

    .cart-item-remove {
      background: transparent;
      border: none;
      color: var(--blush-highlight);
      font-size: 20px;
      cursor: pointer;
      transition: var(--transition);
    }

    .cart-item-remove:hover {
      color: var(--impossible-red);
    }

    /* Coupon section */
    .coupon-section {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      margin-top: var(--spacing-24);
    }

    .coupon-input-group {
      display: flex;
      border: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: var(--radius-buttons);
      overflow: hidden;
      background-color: var(--black);
      margin-bottom: var(--spacing-20);
    }

    .coupon-input-group input {
      flex: 1;
      background: transparent;
      border: none;
      outline: none;
      padding: 12px var(--spacing-16);
      color: var(--white);
      font-family: var(--font-sans);
      font-size: 14px;
    }

    .coupon-input-group button {
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      border: none;
      padding: 0 20px;
      cursor: pointer;
      text-transform: uppercase;
    }

    .coupon-list-title {
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: var(--spacing-12);
    }

    .coupon-card {
      border: 1.5px dashed rgba(255, 255, 255, 0.15);
      border-radius: 8px;
      padding: 12px 16px;
      margin-bottom: var(--spacing-12);
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
      transition: var(--transition);
    }

    .coupon-card:hover {
      border-color: var(--impossible-red);
      background-color: rgba(255, 255, 255, 0.02);
    }

    .coupon-card-left h4 {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 900;
      color: var(--white);
    }

    .coupon-card-left p {
      font-size: 11px;
      color: var(--blush-highlight);
    }

    .coupon-apply-link {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
    }

    /* Bill Summary Card */
    .bill-summary-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      position: sticky;
      top: 112px;
    }

    .bill-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: var(--spacing-12);
      font-size: 14px;
    }

    .bill-lbl {
      color: var(--blush-highlight);
    }

    .bill-val {
      font-family: var(--font-display);
      font-weight: 700;
      color: var(--white);
    }

    .bill-val.discount {
      color: var(--impossible-red);
    }

    .bill-val span.strike {
      text-decoration: line-through;
      color: rgba(255, 255, 255, 0.4);
      margin-right: 6px;
      font-size: 12px;
    }

    .bill-divider {
      height: 1px;
      border: none;
      border-top: 1px dashed rgba(255, 255, 255, 0.15);
      margin: var(--spacing-16) 0;
    }

    .bill-total-row {
      display: flex;
      justify-content: space-between;
      font-size: 20px;
      font-family: var(--font-display);
      font-weight: 900;
      text-transform: uppercase;
      margin-bottom: var(--spacing-20);
    }

    .bill-total-row .total-val {
      color: var(--impossible-red);
    }

    .savings-badge {
      background-color: rgba(225, 6, 0, 0.1);
      border: 1px solid var(--impossible-red);
      border-radius: 8px;
      padding: 10px;
      text-align: center;
      color: var(--white);
      font-size: 12px;
      font-weight: 600;
      margin-bottom: var(--spacing-24);
    }

    .btn-checkout {
      width: 100%;
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 15px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      border: none;
      border-radius: var(--radius-buttons);
      padding: 14px;
      cursor: pointer;
      transition: var(--transition);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }

    .btn-checkout:hover {
      opacity: 0.9;
    }

    .delivery-estimate {
      font-size: 12px;
      color: var(--blush-highlight);
      text-align: center;
      margin-top: var(--spacing-12);
      display: block;
    }

    /* ====== PREMIUM FOOTER ====== */
    .footer {
      background-color: var(--black);
      padding: var(--spacing-80) 0 var(--spacing-40);
      border-top: 1.5px solid var(--impossible-red);
      margin-top: var(--spacing-80);
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
    @media (max-width: 1024px) {
      .cart-layout {
        grid-template-columns: 1fr;
      }
      .bill-summary-card {
        position: static;
      }
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
      .page-header h1 {
        font-size: 36px;
      }
      .footer-grid {
        grid-template-columns: 1fr;
      }
    }
    
    .empty-cart{
    min-height:70vh;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
}

.empty-cart-icon{
    font-size:100px;
    margin-bottom:20px;
}

.empty-cart h1{
    color:white;
    font-size:42px;
    margin-bottom:10px;
    font-family:var(--font-display);
}

.empty-cart p{
    color:#d8d8d8;
    font-size:18px;
    width:500px;
    max-width:90%;
    margin-bottom:30px;
}

.browse-btn{
    background:#e10600;
    color:white;
    padding:15px 35px;
    border-radius:12px;
    text-decoration:none;
    font-weight:bold;
    transition:.3s;
}

.browse-btn:hover{
    background:#b30000;
}
  </style>
</head>
<body>

  <%
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		
		RestaurantDAOImpl restdao = new RestaurantDAOImpl();
		Restaurant restaurant = restdao.getRestaurant(restaurantId);
		
		 
		
		
		%>


  <!-- NAVBAR -->
  <nav class="navbar">
    <div class="container nav-inner">
      <a href="index.jsp" class="nav-logo">BENGALURU <span>FEASTS</span></a>

      <!-- Desktop Menu -->
      <ul class="nav-menu">
        <li><a href="index.jsp" class="nav-link">Home</a></li>
        <li><a href="restaurant" class="nav-link">Restaurants</a></li>
        <li><a href="#" class="nav-link">Collections</a></li>
        <li><a href="profile.jsp" class="nav-link no-caret">Profile</a></li>
      </ul>

      <div class="nav-actions">
        <a href="cart.jsp" class="btn-ghost cart-btn no-caret active">
          &#128092; CART
          <span class="cart-badge"><%=cart.getItems().size() %></span>
        </a>
        <a href="login.jsp" class="btn-primary">LOGIN ▶</a>
        
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

  <!-- BREADCRUMBS & PAGE HEADER -->
  <header class="container">
    <div class="page-header">
      <div class="breadcrumb">
        <a href="index.jsp">Home</a>
        <span class="separator">/</span>
        <a href="restaurant">Restaurants</a>
        <span class="separator">/</span>
        <span>Cart</span>
      </div>
      <h1 class="page-title">YOUR <span>SHOPPING CART</span></h1>
    </div>
  </header>
  
<%
		double itemTotal = 0;
        double deliveryCharge = 39;
        double platfromFees= 10;
        double gst = 42;
		
		if(cart != null && !cart.getItems().isEmpty()){

%>
  
  
  
  <!-- CART LAYOUT -->
  <main class="container cart-layout">
    
    <!-- Left Column: Items and Coupons -->
    <div class="cart-main-content">
      <div class="cart-items-section">
        <h4 class="cart-section-title">ITEMS FROM<%=restaurant.getRestaurantName() %> </h4>
        
        <%
        	for(CartItem item : cart.getItems().values()){
        		itemTotal = itemTotal+item.getTotalPrice();
        		
        		MenuDAOImpl menuDAO = new MenuDAOImpl();
        		Menu menu = menuDAO.getMenu(item.getMenuId());
        		
        		
        %><!-- Item 1: Rava Idli -->
        <div class="cart-item">
          <div class="veg-indicator"></div>
          <div class="cart-item-name-wrap">
            <h4 class="cart-item-name"><%= item.getName() %></h4>
            <p class="cart-item-desc"><%=menu.getDescription() %></p>
          </div>
          <div class="qty-controls">
          
            <form action="CartServlet" method="post">
           <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
           <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
           <input type="hidden" name="action" value="update">
           <input type="hidden" name="quantity" value="<%=item.getQuantity()-1%>">
           <button type="submit" class="qty-btn" class="qty-btn" aria-label="Decrease">&minus;</button>
</form>
            <span class="qty-value"><%=item.getQuantity() %></span>
            
            
            <form action="CartServlet" method=post>
            
            <input type= hidden name=menuId value="<%=item.getMenuId()%>">
            <input type=hidden name=restaurantId value="<%=restaurantId%>">
            <input type= hidden name=action value="update">
            <input type="hidden" name="quantity" value="<%=item.getQuantity()+1%>">
            <button class="qty-btn" type=submit aria-label="Increase">+</button>
            
            </form>
            
            
            
            
            
            
            
          </div>
          <span class="cart-item-price">₹<%=item.getPrice()*item.getQuantity() %></span>
          
          <form action="CartServlet" method=post>
          <input type= hidden name=menuId value="<%=item.getMenuId()%>">
            <input type=hidden name=restaurantId value="<%=restaurantId%>">
            <input type= hidden name=action value="delete">
            <input type="hidden" name="quantity" value="<%=item.getQuantity()+1%>">
            <button class="cart-item-remove" aria-label="Remove">&times;</button>
            
            </form>
          
          
          
          
          
          
          
          
        </div>
        
        
        
        
        <% 
        		
        	}
        
        %>
    
      </div>

      <!-- Coupon Area -->
      <div class="coupon-section">
        <h2 class="cart-section-title">EXCLUSIVE VOUCHERS</h2>
        <div class="coupon-input-group">
          <input type="text" placeholder="ENTER COUPON CODE" aria-label="Coupon code text">
          <button type="button">APPLY</button>
        </div>
        
        <div class="coupon-list-title">AVAILABLE DISCOUNTS</div>
        
        <div class="coupon-card">
          <div class="coupon-card-left">
            <h4>WELCOME50</h4>
            <p>50% off up to ₹100 on your very first order.</p>
          </div>
          <span class="coupon-apply-link">APPLY ▸</span>
        </div>

        <div class="coupon-card">
          <div class="coupon-card-left">
            <h4>BLRFREE</h4>
            <p>Free delivery on orders exceeding ₹200 this weekend.</p>
          </div>
          <span class="coupon-apply-link">APPLY ▸</span>
        </div>
      </div>
    </div>

    <!-- Right Column: Bill Details -->
    <aside class="bill-summary-card">
      <h2 class="cart-section-title">BILL DETAILS</h2>
      
      <div class="bill-row">
        <span class="bill-lbl">Item Subtotal</span>
        <span class="bill-val">₹<%=itemTotal%></span>
      </div>
      <div class="bill-row">
        <span class="bill-lbl">Delivery Fee</span>
        <span class="bill-val"><span class="strike">₹59</span> ₹<%=deliveryCharge %></span>
      </div>
      <div class="bill-row">
        <span class="bill-lbl">Platform charges</span>
        <span class="bill-val">₹<%=platfromFees %></span>
      </div>
      <div class="bill-row">
        <span class="bill-lbl">GST &amp; Taxes</span>
        <span class="bill-val">₹<%=gst %></span>
      </div>
     

      <hr class="bill-divider">

      <div class="bill-total-row">
        <span>TO PAY</span>
        <span class="total-val">₹<%=itemTotal + deliveryCharge + platfromFees + gst %></span>
      </div>

      <div class="savings-badge">
        &#127881; YOU SAVED ₹70 ON THIS ORDER WITH BLRFREE!
      </div>

      <a href="order.jsp" class="btn-checkout">PROCEED TO CHECKOUT ▶</a>
      
      <span class="delivery-estimate">&#128337; ESTIMATED DELIVERY: 25 MINUTES</span>
    </aside>

  </main>
  
  <%
}else{
%>

<div class="empty-cart">

    <div class="empty-cart-icon">
        🛒
    </div>

    <h1>Your Cart is Empty</h1>

    <p>
        Looks like you haven't added anything yet.
        Discover delicious food from our restaurants.
    </p>

    <a href="restaurant" class="browse-btn">
        🍽 Browse Restaurants
    </a>

</div>

<%
}
%>



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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%@ page import="com.tap.model.CartItem,com.tap.model.Cart,com.tap.model.Restaurant,com.tap.DAOImp.RestaurantDAOImpl,com.tap.model.Menu,com.tap.DAOImp.MenuDAOImpl"%>
    
    
    



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Select delivery address and payment method to place your order on Bengaluru Feasts.">
  <title>CHECKOUT — BENGALURU FEASTS</title>
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

    /* ====== STEPPER PROGRESS TRACKER ====== */
    .checkout-stepper-wrap {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-24) var(--spacing-40);
      margin-bottom: var(--spacing-32);
      display: flex;
      justify-content: space-between;
      position: relative;
    }

    .checkout-stepper-wrap::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 10%;
      right: 10%;
      height: 2px;
      background-color: rgba(255, 255, 255, 0.1);
      transform: translateY(-50%);
      z-index: 1;
    }

    .step-node {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: var(--spacing-8);
      position: relative;
      z-index: 2;
    }

    .step-circle {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background-color: var(--black);
      border: 2px solid rgba(255, 255, 255, 0.2);
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      color: var(--blush-highlight);
    }

    .step-node.active .step-circle {
      border-color: var(--impossible-red);
      background-color: var(--impossible-red);
      color: var(--white);
      box-shadow: 0 0 0 4px rgba(225, 6, 0, 0.25);
    }

    .step-node.completed .step-circle {
      border-color: var(--white);
      background-color: var(--white);
      color: var(--black);
    }

    .step-label {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .step-node.active .step-label {
      color: var(--white);
    }

    /* ====== CHECKOUT GRID LAYOUT ====== */
    .checkout-layout {
      display: grid;
      grid-template-columns: 1fr 400px;
      gap: var(--spacing-32);
      padding-bottom: var(--spacing-80);
      align-items: start;
    }

    .checkout-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      margin-bottom: var(--spacing-24);
    }

    .checkout-section-title {
      font-family: var(--font-display);
      font-size: 24px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      border-bottom: 2px solid var(--velvet-wine);
      padding-bottom: var(--spacing-12);
      margin-bottom: var(--spacing-20);
      display: flex;
      align-items: center;
      gap: var(--spacing-8);
    }

    /* Address Selection Cards */
    .address-selection-cards {
      display: flex;
      flex-direction: column;
      gap: var(--spacing-12);
      margin-bottom: var(--spacing-20);
    }

    .address-option-card {
      background-color: var(--black);
      border: 1.5px solid rgba(255, 255, 255, 0.1);
      border-radius: var(--radius-cards);
      padding: var(--spacing-20);
      cursor: pointer;
      display: flex;
      gap: var(--spacing-16);
      transition: var(--transition);
    }

    .address-option-card:hover {
      border-color: rgba(255, 255, 255, 0.3);
    }

    .address-option-card.selected {
      border-color: var(--impossible-red);
      background-color: rgba(225, 6, 0, 0.04);
    }

    .radio-dot-outer {
      width: 20px;
      height: 20px;
      border-radius: 50%;
      border: 2px solid rgba(255, 255, 255, 0.3);
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      margin-top: 2px;
    }

    .address-option-card.selected .radio-dot-outer {
      border-color: var(--impossible-red);
    }

    .radio-dot-inner {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      background-color: transparent;
    }

    .address-option-card.selected .radio-dot-inner {
      background-color: var(--impossible-red);
    }

    .address-info-wrap {
      flex: 1;
    }

    .address-tag {
      font-family: var(--font-display);
      font-size: 15px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: var(--spacing-4);
    }

    .address-full-text {
      font-size: 13px;
      color: var(--blush-highlight);
      line-height: 1.5;
    }

    .btn-dashed-outline {
      width: 100%;
      background-color: transparent;
      border: 1.5px dashed rgba(255, 255, 255, 0.2);
      border-radius: var(--radius-buttons);
      color: var(--blush-highlight);
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      text-transform: uppercase;
      padding: 12px;
      cursor: pointer;
      transition: var(--transition);
      text-align: center;
      letter-spacing: 0.5px;
    }

    .btn-dashed-outline:hover {
      border-color: var(--impossible-red);
      color: var(--white);
    }

    /* Payment Methods Selection */
    .payment-selection-list {
      display: flex;
      flex-direction: column;
      gap: var(--spacing-12);
    }

    .payment-option-row {
      background-color: var(--black);
      border: 1.5px solid rgba(255, 255, 255, 0.1);
      border-radius: var(--radius-cards);
      padding: var(--spacing-16) var(--spacing-20);
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: var(--spacing-16);
      transition: var(--transition);
    }

    .payment-option-row:hover {
      border-color: rgba(255, 255, 255, 0.3);
    }

    .payment-option-row.selected {
      border-color: var(--impossible-red);
      background-color: rgba(225, 6, 0, 0.04);
    }

    .payment-option-row.selected .radio-dot-outer {
      border-color: var(--impossible-red);
    }

    .payment-text-wrap {
      flex: 1;
      display: flex;
      align-items: center;
      gap: var(--spacing-12);
    }

    .payment-icon-symbol {
      font-size: 20px;
    }

    .payment-name {
      font-family: var(--font-display);
      font-size: 15px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .payment-name span {
      font-family: var(--font-sans);
      font-size: 11px;
      color: var(--blush-highlight);
      text-transform: none;
      margin-left: 8px;
    }

    /* Instructions styling */
    .instructions-textarea {
      width: 100%;
      background-color: var(--black);
      border: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: 8px;
      padding: 12px 16px;
      color: var(--white);
      font-family: var(--font-sans);
      font-size: 14px;
      min-height: 70px;
      outline: none;
      resize: vertical;
      transition: var(--transition);
      margin-bottom: var(--spacing-16);
    }

    .instructions-textarea:focus {
      border-color: var(--impossible-red);
    }

    .quick-tips-row {
      display: flex;
      flex-wrap: wrap;
      gap: var(--spacing-8);
    }

    .tip-pill {
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      padding: 6px 12px;
      border: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: var(--radius-toggles);
      color: var(--blush-highlight);
      cursor: pointer;
      background-color: transparent;
      transition: var(--transition);
    }

    .tip-pill:hover {
      border-color: var(--impossible-red);
      color: var(--white);
    }

    /* Order Summary Column (Right) */
    .order-summary-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      position: sticky;
      top: 112px;
    }

    .summary-rest-link {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: var(--spacing-16);
      display: inline-block;
    }

    .summary-item-row {
      display: flex;
      justify-content: space-between;
      font-size: 13px;
      margin-bottom: var(--spacing-8);
      color: var(--blush-highlight);
    }

    .summary-item-name {
      flex: 1;
    }

    .summary-item-qty {
      padding: 0 var(--spacing-12);
      font-weight: 700;
    }

    .summary-item-price {
      font-family: var(--font-display);
      font-weight: 700;
      color: var(--white);
    }

    .bill-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: var(--spacing-12);
      font-size: 13px;
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

    .btn-place-order {
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

    .btn-place-order:hover {
      opacity: 0.9;
    }

	.empty-cart{
    width:450px;
    margin:100px auto;
    text-align:center;
    background:#ffffff;
    padding:40px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.2);
}

.cart-icon{
    font-size:70px;
    margin-bottom:20px;
}

.empty-cart h2{
    font-size:30px;
    color:#222;
    margin-bottom:15px;
}

.empty-cart p{
    color:#666;
    font-size:16px;
    line-height:25px;
    margin-bottom:30px;
}

.browse-btn{
    display:inline-block;
    background:#ff4d4d;
    color:white;
    padding:14px 28px;
    text-decoration:none;
    border-radius:10px;
    font-size:18px;
    font-weight:bold;
    transition:0.3s;
}

.browse-btn:hover{
    background:#e60000;
    transform:scale(1.05);
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
      .checkout-layout {
        grid-template-columns: 1fr;
      }
      .order-summary-card {
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
      .checkout-stepper-wrap {
        flex-direction: column;
        gap: var(--spacing-12);
        padding: var(--spacing-20);
        align-items: flex-start;
      }
      .checkout-stepper-wrap::before {
        display: none;
      }
      .footer-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>

 <%
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		
		RestaurantDAOImpl restdao = new RestaurantDAOImpl();
		Restaurant restaurant = restdao.getRestaurant(restaurantId);
		
		double itemTotal = 0;
        double deliveryCharge = 39;
        double platfromFees= 10;
        double gst = 42;
        
        if(cart!=null && !cart.getItems().isEmpty()){
        	
        	for(CartItem item : cart.getItems().values()){
        		itemTotal = itemTotal + item.getTotalPrice();
        	}
        }
        double grandTotal = itemTotal+deliveryCharge+platfromFees+gst;
        System.out.println("Grand Total in JSP = " + grandTotal);
        session.setAttribute("grandTotal", grandTotal);
        
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
        <a href="cart.jsp" class="btn-ghost cart-btn no-caret">
          &#128092; CART
          <span class="cart-badge"><%=cart.getItems().size() %></span>
        </a>
        
        
        
        <%@ page import="com.tap.model.User" %>

        <%
        User user = (User) session.getAttribute("loggedInUser");
        
        
        
        if(user == null){
        %>
        	<a href="login.jsp" class="btn-primary">LOGIN ▸</a>
        	
        <% 
        }else{

        %>
        
        
        <a href="login.jsp" class="btn-primary"><%=user.getUserName() %> ▸</a>
        	
        	
        	
        	
       <%
      }
        %>
        
        
       
        
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
        <a href="cart.jsp">Cart</a>
        <span class="separator">/</span>
        <span>Checkout</span>
      </div>
      <h1 class="page-title">COMPLETE <span>YOUR ORDER</span></h1>
    </div>
  </header>
  
  
 
        <%
		
		if(cart != null && !cart.getItems().isEmpty()){

		%>

  <!-- CHECKOUT GRID LAYOUT -->
  <main class="container">
<form action="checkout" method="post">
    
    <!-- Stepper progress bar -->
    <div class="checkout-stepper-wrap">
      <div class="step-node completed">
        <div class="step-circle">1</div>
        <span class="step-label">Cart Review</span>
      </div>
      <div class="step-node active">
        <div class="step-circle">2</div>
        <span class="step-label">Delivery &amp; Pay</span>
      </div>
      <div class="step-node">
        <div class="step-circle">3</div>
        <span class="step-label">Confirmation</span>
      </div>
    </div>

    <div class="checkout-layout">
      <!-- Left Column: Address, Payment & Instructions -->
      <div class="checkout-main-content">
        <!-- 1. Delivery Address -->
        <div class="checkout-card">
          <h2 class="checkout-section-title">&#128205; Delivery Address</h2>
          <div class="address-selection-cards">
            <!-- Saved Home -->
            <div class="address-option-card selected">
              <div class="radio-dot-outer">
                <div class="radio-dot-inner"></div>
              </div>
              <div class="address-info-wrap">
                <h4 class="address-tag">&#127968; Home</h4>
                <p class="address-full-text">42, Jubilee Hills, Road No. 5, Hyderabad - 500033 (Current Active Location: Indiranagar, Bangalore - 560038)</p>
              </div>
            </div>

            <!-- Saved Office -->
            <div class="address-option-card">
              <div class="radio-dot-outer">
                <div class="radio-dot-inner"></div>
              </div>
              <div class="address-info-wrap">
                <h4 class="address-tag">&#127970; Office</h4>
                <p class="address-full-text">WeWork Galaxy, 43 Residency Road, Shantala Nagar, Bangalore - 560025</p>
              </div>
            </div>
          </div>
          <button type="button" class="btn-dashed-outline">+ Add New Address</button>
        </div>

        <!-- 2. Payment Method -->
        <div class="checkout-card">
          <h2 class="checkout-section-title">&#128179; Payment Method</h2>
          <div class="payment-selection-list">
            <label class="payment-option-row selected">
              <input type="radio" name="paymentMethod" value="UPI" checked>
              <div class="payment-text-wrap"><span class="payment-icon-symbol">&#128241;</span><h4 class="payment-name">UPI</h4></div>
            </label>
            <label class="payment-option-row">
              <input type="radio" name="paymentMethod" value="CARD">
              <div class="payment-text-wrap"><span class="payment-icon-symbol">&#128179;</span><h4 class="payment-name">Credit / Debit Card</h4></div>
            </label>
            <label class="payment-option-row">
              <input type="radio" name="paymentMethod" value="Cash">
              <div class="payment-text-wrap"><span class="payment-icon-symbol">&#128176;</span><h4 class="payment-name">Cash on Delivery</h4></div>
            </label>
          </div>
        </div>

<!-- 3. Delivery Instructions -->
        <div class="checkout-card">
          <h2 class="checkout-section-title">&#128221; Delivery Instructions</h2>
          <textarea class="instructions-textarea" placeholder="Add custom instructions for the rider (e.g. gate code, leave at reception)..." aria-label="Instructions"></textarea>
          <div class="quick-tips-row">
            <button type="button" class="tip-pill">Avoid ringing bell</button>
            <button type="button" class="tip-pill">Leave at door</button>
            <button type="button" class="tip-pill">Call when arriving</button>
          </div>
        </div>
      </div>

      <!-- Right Column: Order Summary (Sticky) -->
      <aside class="order-summary-card">
        <h2 class="checkout-section-title">ORDER SUMMARY</h2>
        <a href="menu.jsp" class="summary-rest-link"><%=restaurant.getRestaurantName() %></a>
        
        <div class="summary-items-list">
           <%
        	for(CartItem item : cart.getItems().values()){
        		
        		MenuDAOImpl menuDAO = new MenuDAOImpl();
        		Menu menu = menuDAO.getMenu(item.getMenuId());
        		
        		
        %> 
        
        <div class="summary-item-row">
            <span class="summary-item-name"><%=item.getName() %></span>
            <span class="summary-item-qty">× <%=item.getQuantity() %></span>
            <span class="summary-item-price">₹<%=item.getPrice() %></span>
          </div>
          
          <% 
        	}
          
          %>
          
          
        </div>

        <hr class="bill-divider">

        <div class="bill-row"><span class="bill-lbl">Subtotal</span><span class="bill-val">₹<%=itemTotal %></span></div>
        <div class="bill-row"><span class="bill-lbl">Delivery Fee</span><span class="bill-val">₹<%=deliveryCharge %></span></div>
        <div class="bill-row"><span class="bill-lbl">Platform charges</span><span class="bill-val">₹<%=platfromFees %></span></div>
        <div class="bill-row"><span class="bill-lbl">GST</span><span class="bill-val">₹<%=gst %></span></div>
        <div class="bill-row"><span class="bill-lbl">Coupon Discount</span><span class="bill-val discount">-₹50</span></div>

        <hr class="bill-divider" style="border-top-style: dashed;">

        <div class="bill-total-row">
          <span>TOTAL</span>
          <span class="total-val">₹<%=itemTotal + deliveryCharge + platfromFees + gst %></span>
        </div>

        <div class="savings-badge">
          &#127881; SAVING ₹70 ON THIS ORDER
        </div>

        <button type="submit" class="btn-place-order">PLACE ORDER — ₹<%= itemTotal + deliveryCharge + platfromFees + gst%> ▸</button>
      </aside>
    </div>

  </form>
</main>
  
 <%
		}else{		
	%>		
	<div class="empty-cart">

    <div class="cart-icon">🛒</div>

    <h2>Your Cart is Empty</h2>

    <p>
        Looks like you haven't added any delicious food yet.
        Browse restaurants and start your order.
    </p>

    <a href="restaurant" class="browse-btn">
        Browse Restaurants
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User" %>

<%
User user = (User) session.getAttribute("loggedInUser");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

// ---- Build initials for the avatar dynamically from the logged in user's name ----
String fullName = user.getUserName();
String initials = "U";
if (fullName != null && !fullName.trim().isEmpty()) {
    String[] parts = fullName.trim().split("\\s+");
    StringBuilder sb = new StringBuilder();
    sb.append(Character.toUpperCase(parts[0].charAt(0)));
    if (parts.length > 1) {
        sb.append(Character.toUpperCase(parts[parts.length - 1].charAt(0)));
    }
    initials = sb.toString();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="View and manage your account details, addresses, and order history on Bengaluru Feasts.">
  <title>My Profile – Bengaluru Feasts</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Oswald:wght@500;700;900&display=swap" rel="stylesheet">
  <style>
    :root {
      --velvet-wine: #260212;
      --burgundy-stage: #4f0423;
      --impossible-red: #e10600;
      --blush-highlight: #ffc7c6;
      --success: #00b67a;
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
      --spacing-80: 80px;

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
      padding-bottom: var(--spacing-80);
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
      margin-bottom: var(--spacing-40);
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

    /* ====== PROFILE HEADER ====== */
    .profile-header-card {
      background:
        radial-gradient(circle at 50% -20%, rgba(225, 6, 0, 0.25), transparent 60%),
        var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-40);
      text-align: center;
      margin-bottom: var(--spacing-24);
      position: relative;
      overflow: hidden;
    }

    /* Dynamic initials avatar — replaces the old hardcoded "RS" */
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--impossible-red), var(--velvet-wine));
      color: var(--white);
      font-family: var(--font-display);
      font-size: 36px;
      font-weight: 900;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto var(--spacing-16);
      border: 3px solid var(--white);
      box-shadow: 0 0 0 4px rgba(225, 6, 0, 0.35), 0 8px 24px rgba(0, 0, 0, 0.4);
      letter-spacing: 1px;
      user-select: none;
    }

    .profile-name {
      font-family: var(--font-display);
      font-size: 32px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      line-height: 1.1;
      margin-bottom: var(--spacing-4);
    }

    .profile-email {
      font-size: 14px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    .member-badge {
      display: inline-block;
      background-color: var(--black);
      border: 1px solid var(--impossible-red);
      color: var(--blush-highlight);
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      padding: 6px 16px;
      border-radius: var(--radius-toggles);
      margin-bottom: var(--spacing-20);
    }

    /* Loyalty progress bar — new, keeps same theme colors */
    .loyalty-wrap {
      max-width: 360px;
      margin: 0 auto;
      text-align: left;
    }

    .loyalty-labels {
      display: flex;
      justify-content: space-between;
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 6px;
    }

    .loyalty-track {
      width: 100%;
      height: 8px;
      border-radius: 20px;
      background-color: rgba(0, 0, 0, 0.35);
      overflow: hidden;
      border: 1px solid rgba(255, 255, 255, 0.08);
    }

    .loyalty-fill {
      height: 100%;
      width: 68%;
      border-radius: 20px;
      background: linear-gradient(90deg, var(--impossible-red), var(--blush-highlight));
    }

    /* Stats Grid */
    .stats-row {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: var(--spacing-16);
      margin-bottom: var(--spacing-32);
    }

    .stat-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-20) var(--spacing-16);
      text-align: center;
      transition: var(--transition);
    }

    .stat-card:hover {
      border-color: var(--impossible-red);
      transform: translateY(-2px);
    }

    .stat-num {
      font-family: var(--font-display);
      font-size: 32px;
      font-weight: 900;
      color: var(--impossible-red);
      line-height: 1;
      margin-bottom: var(--spacing-4);
    }

    .stat-lbl {
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    /* ====== CARDS ====== */
    .card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      margin-bottom: var(--spacing-24);
    }

    .card-title {
      font-family: var(--font-display);
      font-size: 20px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      border-bottom: 2px solid var(--velvet-wine);
      padding-bottom: var(--spacing-8);
      margin-bottom: var(--spacing-20);
    }

    /* Personal info details */
    .info-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: var(--spacing-12) 0;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    .info-row:last-child {
      border-bottom: none;
    }

    .info-lbl {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 2px;
    }

    .info-val {
      font-size: 14px;
      font-weight: 600;
    }

    .info-action-link {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
    }

    /* Saved addresses */
    .address-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: var(--spacing-16);
      margin-bottom: var(--spacing-20);
    }

    .address-card {
      background-color: var(--black);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 8px;
      padding: var(--spacing-16) var(--spacing-20);
      transition: var(--transition);
    }

    .address-card:hover {
      border-color: var(--impossible-red);
    }

    .addr-tag {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: var(--spacing-4);
    }

    .addr-text {
      font-size: 12px;
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

    /* Order History Cards */
    .past-order-card {
      background-color: var(--black);
      border: 1px solid rgba(255, 255, 255, 0.08);
      border-radius: 8px;
      padding: var(--spacing-20);
      margin-bottom: var(--spacing-16);
      transition: var(--transition);
    }

    .past-order-card:hover {
      border-color: rgba(255, 255, 255, 0.2);
    }

    .past-order-card:last-child {
      margin-bottom: 0;
    }

    .order-top-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: var(--spacing-8);
    }

    .order-rest-name {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .order-date-num {
      font-size: 12px;
      color: var(--blush-highlight);
    }

    .order-items-list-text {
      font-size: 13px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    .order-bottom-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-top: 1px solid rgba(255, 255, 255, 0.05);
      padding-top: var(--spacing-12);
    }

    .order-price-bold {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      color: var(--white);
    }

    .order-status-tag {
      background-color: rgba(0, 182, 122, 0.1);
      border: 1px solid var(--success);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 10px;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: 4px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .order-actions {
      display: flex;
      gap: var(--spacing-12);
      align-items: center;
    }

    .btn-action-sm {
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      padding: 6px 16px;
      border-radius: 6px;
      border: none;
      cursor: pointer;
    }

    .btn-action-sm-ghost {
      background: transparent;
      color: var(--white);
      border: 1.5px solid var(--white);
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      padding: 4px 14px;
      border-radius: 6px;
      cursor: pointer;
    }

    .btn-logout {
      width: 100%;
      background-color: transparent;
      border: 1.5px solid var(--impossible-red);
      color: var(--impossible-red);
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      padding: 12px;
      border-radius: var(--radius-buttons);
      cursor: pointer;
      text-align: center;
      letter-spacing: 1px;
      transition: var(--transition);
      margin-top: var(--spacing-16);
    }

    .btn-logout:hover {
      background-color: var(--impossible-red);
      color: var(--white);
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
      .stats-row {
        grid-template-columns: 1fr;
      }
      .address-grid {
        grid-template-columns: 1fr;
      }
      .order-top-row {
        flex-direction: column;
        align-items: flex-start;
        gap: var(--spacing-4);
      }
      .order-bottom-row {
        flex-direction: column;
        gap: var(--spacing-12);
        align-items: flex-start;
      }
      .order-actions {
        width: 100%;
        justify-content: space-between;
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
        <li><a href="restaurant" class="nav-link">Restaurants</a></li>
        <li><a href="#" class="nav-link">Collections</a></li>
        <li><a href="profile.jsp" class="nav-link active">Profile</a></li>
      </ul>

      <div class="nav-actions">
        <a href="cart.jsp" class="btn-ghost cart-btn no-caret">
          &#128092; CART
          <span class="cart-badge">4</span>
        </a>
        <a href="login.jsp" class="btn-primary">LOGIN</a>

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

  <main class="container">

    <!-- Profile Header Card -->
    <div class="profile-header-card">
      <!-- Avatar now built from the logged-in user's own initials, not a hardcoded value -->
      <div class="profile-avatar"><%= initials %></div>
      <h1 class="profile-name"><%= user.getUserName() %></h1>
      <p class="profile-email"><%= user.getEmail() %></p>
      <br>
      <span class="member-badge">&#127942; MEMBER SINCE JAN 2024</span>

      <!-- New: loyalty progress, same theme colors -->
      <div class="loyalty-wrap">
        <div class="loyalty-labels">
          <span>Silver Member</span>
          <span>Gold in 320 pts</span>
        </div>
        <div class="loyalty-track">
          <div class="loyalty-fill"></div>
        </div>
      </div>
    </div>

    <!-- Stats Grid Row -->
    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-num">15</div>
        <span class="stat-lbl">Total Orders</span>
      </div>
      <div class="stat-card">
        <div class="stat-num">8</div>
        <span class="stat-lbl">Saved Places</span>
      </div>
      <div class="stat-card">
        <div class="stat-num">3</div>
        <span class="stat-lbl">Coupons Claimed</span>
      </div>
    </div>

    <!-- Personal Info Card -->
    <div class="card">
      <h2 class="card-title">Personal Information</h2>
      <div class="info-row">
        <div>
          <div class="info-lbl">Full Name</div>
          <span class="info-val"><%= user.getUserName() %></span>
        </div>
        <a href="#" class="info-action-link">Edit</a>
      </div>
      <div class="info-row">
        <div>
          <div class="info-lbl">Email Address</div>
          <span class="info-val"><%= user.getEmail() %></span>
        </div>
        <a href="#" class="info-action-link">Edit</a>
      </div>
      <div class="info-row">
        <div>
          <div class="info-lbl">Phone Number</div>
          <span class="info-val">+91 98765 43210</span>
        </div>
        <a href="#" class="info-action-link">Edit</a>
      </div>
    </div>

    <!-- Saved Addresses Card -->
    <div class="card">
      <h2 class="card-title">Saved Delivery Addresses</h2>
      <div class="address-grid">
        <div class="address-card">
          <h4 class="addr-tag">&#127968; Home</h4>
          <p class="addr-text"><%=user.getAddress() %></p>
        </div>
        <div class="address-card">
          <h4 class="addr-tag">&#127970; Office</h4>
          <p class="addr-text">WeWork Galaxy, 43 Residency Road, Shantala Nagar, Bangalore - 560025</p>
        </div>
      </div>
      <button class="btn-dashed-outline">+ Add New Address</button>
    </div>

    <!-- Order History Card -->
    <div class="card">
      <h2 class="card-title">Order History</h2>

      <!-- Past Order 1 -->
      <div class="past-order-card">
        <div class="order-top-row">
          <h4 class="order-rest-name">Mavalli Tiffin Room (MTR)</h4>
          <span class="order-date-num">Order #FE-928420-BLR | 12 Jul 2026</span>
        </div>
        <p class="order-items-list-text">Rava Idli &times; 1, Benne Masala Dosa &times; 1, Filter Coffee &times; 2</p>
        <div class="order-bottom-row">
          <span class="order-price-bold">&#8377;274</span>
          <div class="order-actions">
            <span class="order-status-tag">Delivered</span>
            <button class="btn-action-sm-ghost">Receipt</button>
            <a href="menu.jsp" class="btn-action-sm">REORDER</a>
          </div>
        </div>
      </div>

      <!-- Past Order 2 -->
      <div class="past-order-card">
        <div class="order-top-row">
          <h4 class="order-rest-name">Truffles Cafe</h4>
          <span class="order-date-num">Order #FE-812739-BLR | 08 Jul 2026</span>
        </div>
        <p class="order-items-list-text">Crispy Chicken Burger &times; 2, Salted French Fries &times; 1, Mango Shake &times; 1</p>
        <div class="order-bottom-row">
          <span class="order-price-bold">&#8377;540</span>
          <div class="order-actions">
            <span class="order-status-tag">Delivered</span>
            <button class="btn-action-sm-ghost">Receipt</button>
            <a href="menu.jsp" class="btn-action-sm">REORDER</a>
          </div>
        </div>
      </div>

      <!-- Past Order 3 -->
      <div class="past-order-card">
        <div class="order-top-row">
          <h4 class="order-rest-name">Meghana Foods</h4>
          <span class="order-date-num">Order #FE-739103-BLR | 03 Jul 2026</span>
        </div>
        <p class="order-items-list-text">Andhra Chicken Biryani &times; 1, Paneer Tikka Dry &times; 1</p>
        <div class="order-bottom-row">
          <span class="order-price-bold">&#8377;495</span>
          <div class="order-actions">
            <span class="order-status-tag">Delivered</span>
            <button class="btn-action-sm-ghost">Receipt</button>
            <a href="menu.jsp" class="btn-action-sm">REORDER</a>
          </div>
        </div>
      </div>

      <!-- Logout Button -->
      <a href="login.jsp" class="btn-logout">LOGOUT FROM ACCOUNT</a>
    </div>

  </main>

</body>
</html>

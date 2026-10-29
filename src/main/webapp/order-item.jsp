<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Your order has been placed successfully. Track your food live on Bengaluru Feasts.">
  <title>ORDER CONFIRMED â BENGALURU FEASTS</title>
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
      --max-width: 800px;
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
      background-color: var(--black);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      height: 72px;
      width: 100%;
      margin-bottom: var(--spacing-32);
    }

    .nav-inner {
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 100%;
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 24px;
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
      padding: 8px 16px;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      cursor: pointer;
      transition: var(--transition);
    }

    .btn-ghost:hover {
      background-color: rgba(255, 255, 255, 0.08);
    }

    /* ====== CONFIRMATION HEADER ====== */
    .confirm-header {
      text-align: center;
      margin-bottom: var(--spacing-40);
    }

    @keyframes scaleIn {
      0% { transform: scale(0); opacity: 0; }
      70% { transform: scale(1.15); }
      100% { transform: scale(1); opacity: 1; }
    }

    .check-circle {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: var(--white);
      color: var(--black);
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-display);
      font-size: 40px;
      font-weight: 900;
      margin: 0 auto var(--spacing-20);
      animation: scaleIn 0.5s cubic-bezier(0.4, 0, 0.2, 1);
      border: 3px solid var(--impossible-red);
    }

    .confirm-header h1 {
      font-family: var(--font-display);
      font-size: 40px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: var(--spacing-4);
      line-height: 1;
    }

    .confirm-sub {
      font-size: 15px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-8);
    }

    .order-id-badge {
      font-family: var(--font-display);
      font-size: 13px;
      color: var(--white);
      font-weight: 700;
      letter-spacing: 1px;
      background-color: var(--burgundy-stage);
      padding: 6px 16px;
      border-radius: var(--radius-toggles);
      display: inline-block;
      border: 1px solid rgba(255,255,255,0.08);
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

    /* Order Items Table */
    .order-table {
      width: 100%;
      border-collapse: collapse;
    }

    .order-table th {
      text-align: left;
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      text-transform: uppercase;
      color: var(--blush-highlight);
      letter-spacing: 1px;
      padding-bottom: var(--spacing-12);
      border-bottom: 2px solid rgba(255, 255, 255, 0.08);
    }

    .order-table th.right-align, .order-table td.right-align {
      text-align: right;
    }

    .order-table th.center-align, .order-table td.center-align {
      text-align: center;
    }

    .order-table td {
      padding: var(--spacing-16) 0;
      font-size: 14px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    .item-cell {
      display: flex;
      align-items: center;
      gap: var(--spacing-8);
    }

    /* Veg indicator */
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

    .item-name {
      font-family: var(--font-display);
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .price-num {
      font-family: var(--font-display);
      font-weight: 700;
      color: var(--white);
    }

    /* Bill break down rows */
    .bill-row td {
      padding: var(--spacing-8) 0;
      border-bottom: none;
      font-size: 13px;
      color: var(--blush-highlight);
    }

    .bill-row.discount-row td {
      color: var(--impossible-red);
    }

    .bill-row.first-bill-row td {
      padding-top: var(--spacing-20);
      border-top: 1px dashed rgba(255, 255, 255, 0.1);
    }

    .grand-total-row td {
      font-size: 20px;
      font-family: var(--font-display);
      font-weight: 900;
      color: var(--impossible-red);
      padding-top: var(--spacing-16);
      border-top: 2px solid var(--black);
      border-bottom: none;
    }

    /* ====== DELIVERY DETAILS ====== */
    .details-list {
      display: flex;
      flex-direction: column;
      gap: var(--spacing-12);
    }

    .detail-item {
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      padding-bottom: var(--spacing-12);
    }

    .detail-item:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .detail-lbl {
      font-size: 12px;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .detail-val {
      font-size: 14px;
      font-weight: 600;
      text-align: right;
    }

    /* ====== TRACKING TIMELINE ====== */
    .tracker {
      display: flex;
      justify-content: space-between;
      position: relative;
      padding: var(--spacing-20) 0;
    }

    .tracker::before {
      content: '';
      position: absolute;
      top: 34px;
      left: 10%;
      right: 10%;
      height: 2px;
      background-color: rgba(255, 255, 255, 0.1);
      transform: translateY(-50%);
      z-index: 1;
    }

    .track-step {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: var(--spacing-8);
      position: relative;
      z-index: 2;
      flex: 1;
    }

    .track-circle {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      background-color: var(--black);
      border: 2px solid rgba(255, 255, 255, 0.2);
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--blush-highlight);
    }

    .track-step.done .track-circle {
      border-color: var(--white);
      background-color: var(--white);
      color: var(--black);
    }

    .track-step.active .track-circle {
      border-color: var(--impossible-red);
      background-color: var(--impossible-red);
      color: var(--white);
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0%, 100% { box-shadow: 0 0 0 0 rgba(225, 6, 0, 0.4); }
      50% { box-shadow: 0 0 0 8px rgba(225, 6, 0, 0); }
    }

    .track-lbl {
      font-family: var(--font-display);
      font-size: 11px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 0.5px;
      text-align: center;
      line-height: 1.3;
    }

    .track-step.active .track-lbl {
      color: var(--white);
    }

    .track-step.done .track-lbl {
      color: var(--blush-highlight);
    }

    .track-time {
      font-size: 10px;
      color: var(--blush-highlight);
      opacity: 0.8;
      margin-top: 2px;
    }

    .rider-strip {
      display: flex;
      align-items: center;
      gap: var(--spacing-16);
      background-color: var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-16);
      margin-top: var(--spacing-24);
      border: 1px solid rgba(255, 255, 255, 0.08);
    }

    .rider-emoji {
      font-size: 24px;
    }

    .rider-info {
      font-size: 13px;
      color: var(--blush-highlight);
    }

    /* ====== ACTION BUTTONS ====== */
    .actions-row {
      display: flex;
      gap: var(--spacing-16);
      justify-content: center;
      margin: var(--spacing-32) 0;
      flex-wrap: wrap;
    }

    .btn-action-primary {
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      border: none;
      border-radius: var(--radius-buttons);
      padding: 12px 28px;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .btn-action-primary:hover {
      opacity: 0.9;
    }

    .btn-action-ghost {
      background: transparent;
      color: var(--white);
      border: 1.5px solid var(--white);
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      border-radius: var(--radius-buttons);
      padding: 12px 28px;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .btn-action-ghost:hover {
      background-color: rgba(255, 255, 255, 0.08);
      border-color: var(--impossible-red);
    }

    .back-to-home {
      text-align: center;
      margin-top: var(--spacing-24);
    }

    .back-to-home a {
      color: var(--impossible-red);
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .back-to-home a:hover {
      text-decoration: underline;
    }

    @media (max-width: 600px) {
      .tracker {
        flex-direction: column;
        gap: var(--spacing-16);
        align-items: flex-start;
        padding-left: var(--spacing-16);
      }
      .tracker::before {
        display: none;
      }
      .track-step {
        flex-direction: row;
        gap: var(--spacing-12);
        align-items: center;
      }
      .track-lbl {
        text-align: left;
      }
      .actions-row {
        flex-direction: column;
      }
      .btn-action-primary, .btn-action-ghost {
        width: 100%;
        justify-content: center;
      }
    }
  </style>
</head>
<body>

  <!-- NAVBAR -->
  <nav class="navbar">
    <div class="nav-inner">
      <a href="index.jsp" class="nav-logo">BENGALURU <span>FEASTS</span></a>
      <a href="index.jsp" class="btn-ghost">BACK TO HOME</a>
    </div>
  </nav>

  <main class="container">
    <!-- Confirmation Header -->
    <div class="confirm-header">
      <div class="check-circle">â</div>
      <h1>Order Confirmed!</h1>
      <p class="confirm-sub">Your food order has been logged in our databases</p>
      <span class="order-id-badge">ORDER #FE-928420-BLR</span>
    </div>

    <!-- Order Items details (represents the OrderItem DB table) -->
    <div class="card">
      <div class="card-title">Order Receipt</div>
      <table class="order-table">
        <thead>
          <tr>
            <th>Item</th>
            <th class="center-align">Qty</th>
            <th class="right-align">Price</th>
            <th class="right-align">Total</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <div class="item-cell">
                <div class="veg-indicator"></div>
                <span class="item-name">Rava Idli</span>
              </div>
            </td>
            <td class="center-align">1</td>
            <td class="right-align price-num">â¹80</td>
            <td class="right-align price-num">â¹80</td>
          </tr>
          <tr>
            <td>
              <div class="item-cell">
                <div class="veg-indicator"></div>
                <span class="item-name">Benne Masala Dosa</span>
              </div>
            </td>
            <td class="center-align">1</td>
            <td class="right-align price-num">â¹95</td>
            <td class="right-align price-num">â¹95</td>
          </tr>
          <tr>
            <td>
              <div class="item-cell">
                <div class="veg-indicator"></div>
                <span class="item-name">Traditional Filter Coffee</span>
              </div>
            </td>
            <td class="center-align">2</td>
            <td class="right-align price-num">â¹45</td>
            <td class="right-align price-num">â¹90</td>
          </tr>
          
          <!-- Bill breakdowns -->
          <tr class="bill-row first-bill-row">
            <td colspan="3">Subtotal</td>
            <td class="right-align price-num">â¹265</td>
          </tr>
          <tr class="bill-row">
            <td colspan="3">Delivery Fee</td>
            <td class="right-align price-num">â¹39</td>
          </tr>
          <tr class="bill-row">
            <td colspan="3">Platform Fee</td>
            <td class="right-align price-num">â¹5</td>
          </tr>
          <tr class="bill-row">
            <td colspan="3">GST &amp; Taxes</td>
            <td class="right-align price-num">â¹15</td>
          </tr>
          <tr class="bill-row discount-row">
            <td colspan="3">Coupon Discount</td>
            <td class="right-align price-num">-â¹50</td>
          </tr>
          
          <tr class="grand-total-row">
            <td colspan="3"><strong>GRAND TOTAL</strong></td>
            <td class="right-align"><strong>â¹274</strong></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Delivery details -->
    <div class="card">
      <div class="card-title">Delivery Details</div>
      <div class="details-list">
        <div class="detail-item">
          <span class="detail-lbl">Deliver to</span>
          <span class="detail-val">WeWork Galaxy, 43 Residency Road, Bangalore - 560025</span>
        </div>
        <div class="detail-item">
          <span class="detail-lbl">Payment Method</span>
          <span class="detail-val">UPI (Google Pay)</span>
        </div>
        <div class="detail-item">
          <span class="detail-lbl">Order Timestamp</span>
          <span class="detail-val">12 Jul 2026, 11:15 AM</span>
        </div>
      </div>
    </div>

    <!-- Live order tracking stepper -->
    <div class="card">
      <div class="card-title">Live Tracking</div>
      
      <div class="tracker">
        <div class="track-step done">
          <div class="track-circle">â</div>
          <span class="track-lbl">Order Placed</span>
          <span class="track-time">11:15 AM</span>
        </div>
        <div class="track-step active">
          <div class="track-circle">2</div>
          <span class="track-lbl">Preparing</span>
          <span class="track-time">Est. 12 mins</span>
        </div>
        <div class="track-step">
          <div class="track-circle">3</div>
          <span class="track-lbl">Out for Delivery</span>
          <span class="track-time">â</span>
        </div>
        <div class="track-step">
          <div class="track-circle">4</div>
          <span class="track-lbl">Delivered</span>
          <span class="track-time">â</span>
        </div>
      </div>

      <div class="rider-strip">
        <span class="rider-emoji">ð´</span>
        <span class="rider-info">Rider will be assigned as soon as the kitchen begins packing your food.</span>
      </div>
    </div>

    <!-- Action buttons -->
    <div class="actions-row">
      <button class="btn-action-primary">TRACK ORDER â¸</button>
      <button class="btn-action-ghost">NEED HELP?</button>
      <a href="restaurant" class="btn-action-ghost">ORDER AGAIN</a>
    </div>

    <div class="back-to-home">
      <a href="index.jsp">â RETURN TO HOME</a>
    </div>
  </main>

</body>
</html>

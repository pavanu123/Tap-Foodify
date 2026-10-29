<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Register an account on Bengaluru Feasts to explore local dining options and order delicious food.">
  <title>REGISTER â BENGALURU FEASTS</title>
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
      
      --radius-nav: 15px;
      --radius-cards: 12px;
      --radius-buttons: 15px;
      
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
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    a {
      text-decoration: none;
      color: inherit;
      transition: var(--transition);
    }

    /* ====== NAVBAR ====== */
    .navbar {
      background-color: var(--black);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      height: 72px;
      width: 100%;
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

    /* ====== REGISTER WRAPPER ====== */
    .auth-wrapper {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 60px 24px;
      position: relative;
      overflow: hidden;
    }

    .auth-bg-mask {
      position: absolute;
      width: 300px;
      height: 300px;
      background-color: var(--burgundy-stage);
      opacity: 0.4;
      pointer-events: none;
      clip-path: polygon(50% 0%, 95% 25%, 95% 75%, 50% 100%, 5% 75%, 5% 25%);
    }

    .abm-1 { top: -50px; right: -50px; }
    .abm-2 { bottom: -80px; left: -50px; }

    .auth-card {
      width: 100%;
      max-width: 540px;
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: 40px;
      position: relative;
      z-index: 10;
    }

    .auth-header {
      text-align: center;
      margin-bottom: 32px;
    }

    .auth-eyebrow {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--impossible-red);
      letter-spacing: 3px;
      text-transform: uppercase;
      margin-bottom: 8px;
      display: block;
    }

    .auth-title {
      font-family: var(--font-display);
      font-size: 36px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 1px;
      line-height: 1;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-row-2 {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 16px;
    }

    .form-label {
      display: block;
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 6px;
    }

    .form-input {
      width: 100%;
      background-color: var(--black);
      border: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: 8px;
      padding: 12px 16px;
      color: var(--white);
      font-family: var(--font-sans);
      font-size: 15px;
      outline: none;
      transition: var(--transition);
    }

    .form-input:focus {
      border-color: var(--impossible-red);
      box-shadow: 0 0 0 1px var(--impossible-red);
    }

    textarea.form-input {
      resize: vertical;
      min-height: 70px;
    }

    /* Password strength */
    .pwd-strength-wrap {
      margin-top: 8px;
    }

    .pwd-bar-bg {
      height: 4px;
      background-color: var(--black);
      border-radius: 2px;
      overflow: hidden;
      margin-bottom: 4px;
    }

    .pwd-bar-fill {
      width: 65%;
      height: 100%;
      background-color: var(--impossible-red);
    }

    .pwd-strength-text {
      font-size: 11px;
      font-weight: 700;
      color: var(--impossible-red);
      text-transform: uppercase;
    }

    .terms-label {
      display: flex;
      align-items: flex-start;
      gap: 8px;
      font-size: 13px;
      color: var(--blush-highlight);
      cursor: pointer;
      margin-bottom: 28px;
      line-height: 1.4;
    }

    .terms-label input[type="checkbox"] {
      accent-color: var(--impossible-red);
      width: 16px;
      height: 16px;
      cursor: pointer;
      margin-top: 2px;
      flex-shrink: 0;
    }

    .terms-label a {
      color: var(--impossible-red);
      font-weight: 700;
    }

    .terms-label a:hover {
      text-decoration: underline;
    }

    .btn-submit {
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

    .btn-submit:hover {
      opacity: 0.9;
    }

    .auth-footer {
      text-align: center;
      font-size: 14px;
      color: var(--blush-highlight);
      margin-top: 24px;
    }

    .auth-footer a {
      color: var(--impossible-red);
      font-weight: 700;
    }

    .auth-footer a:hover {
      text-decoration: underline;
    }

    @media (max-width: 600px) {
      .form-row-2 {
        grid-template-columns: 1fr;
        gap: 0;
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

  <!-- REGISTER WRAPPER -->
  <main class="auth-wrapper">
    <div class="auth-bg-mask abm-1"></div>
    <div class="auth-bg-mask abm-2"></div>

    <div class="auth-card">
      <div class="auth-header">
        <span class="auth-eyebrow">GET STARTED</span>
        <h1 class="auth-title">CREATE ACCOUNT</h1>
      </div>

      <form action="RegisterServlet" method="post">

    <div class="form-group">
        <label class="form-label" for="userName">FULL NAME</label>
        <input
            type="text"
            id="userName"
            name="userName"
            class="form-input"
            placeholder="Enter your full name"
            required>
    </div>

    <div class="form-group">
        <label class="form-label" for="email">EMAIL ADDRESS</label>
        <input
            type="email"
            id="email"
            name="email"
            class="form-input"
            placeholder="Enter your email"
            required>
    </div>

    <div class="form-group">
        <label class="form-label" for="address">ADDRESS</label>
        <textarea
            id="address"
            name="address"
            class="form-input"
            placeholder="Enter your address"
            required></textarea>
    </div>

    <div class="form-group">
        <label class="form-label" for="password">PASSWORD</label>
        <input
            type="password"
            id="password"
            name="password"
            class="form-input"
            placeholder="Enter your password"
            required>
    </div>

    <div class="form-group">
        <label class="form-label" for="role">ROLE</label>

        <select
            id="role"
            name="role"
            class="form-input"
            required>

            <option value="">Select Role</option>
            <option value="Customer">Customer</option>
            <option value="RestorantAdmin">RestorantAdmin</option>
            <option value="Admin">Admin</option>

        </select>
    </div>

    <label class="terms-label">
        <input type="checkbox" required>
        <span>
            I AGREE TO THE
            <a href="#">TERMS &amp; CONDITIONS</a>
            AND
            <a href="#">PRIVACY POLICY</a>.
        </span>
    </label>

    <button type="submit" class="btn-submit">
        CREATE ACCOUNT ▶
    </button>

</form>

      <div class="auth-footer">
        ALREADY HAVE AN ACCOUNT? <a href="login.jsp">LOGIN HERE</a>
      </div>
    </div>
  </main>

</body>
</html>

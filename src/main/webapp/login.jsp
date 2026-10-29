<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Login to Bengaluru Feasts to explore local dining options and order delicious food.">
  <title>LOGIN â BENGALURU FEASTS</title>
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

    /* ====== LOGIN PAGE CONTAINER ====== */
    .auth-wrapper {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 60px 24px;
      position: relative;
      overflow: hidden;
    }

    /* Decorative Masks in Background */
    .auth-bg-mask {
      position: absolute;
      width: 300px;
      height: 300px;
      background-color: var(--burgundy-stage);
      opacity: 0.4;
      pointer-events: none;
      clip-path: polygon(50% 0%, 95% 25%, 95% 75%, 50% 100%, 5% 75%, 5% 25%);
    }

    .abm-1 { top: -50px; left: -50px; }
    .abm-2 { bottom: -80px; right: -50px; }

    .auth-card {
      width: 100%;
      max-width: 480px;
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

    .form-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 28px;
    }

    .remember-wrap {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 13px;
      color: var(--blush-highlight);
      cursor: pointer;
    }

    .remember-wrap input[type="checkbox"] {
      accent-color: var(--impossible-red);
      width: 16px;
      height: 16px;
      cursor: pointer;
    }

    .forgot-link {
      font-size: 13px;
      color: var(--blush-highlight);
      font-weight: 500;
    }

    .forgot-link:hover {
      color: var(--white);
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

    .divider-wrap {
      display: flex;
      align-items: center;
      gap: 16px;
      margin: 24px 0;
    }

    .divider-line {
      flex: 1;
      height: 1px;
      background-color: rgba(255, 255, 255, 0.08);
    }

    .divider-text {
      font-family: var(--font-display);
      font-size: 12px;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .social-actions {
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin-bottom: 28px;
    }

    .social-btn {
      width: 100%;
      background-color: transparent;
      border: 1px solid rgba(255, 255, 255, 0.15);
      border-radius: var(--radius-buttons);
      padding: 12px;
      color: var(--white);
      font-family: var(--font-display);
      font-size: 13px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      cursor: pointer;
      transition: var(--transition);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .social-btn:hover {
      background-color: rgba(255, 255, 255, 0.05);
      border-color: var(--white);
    }

    .auth-footer {
      text-align: center;
      font-size: 14px;
      color: var(--blush-highlight);
    }

    .auth-footer a {
      color: var(--impossible-red);
      font-weight: 700;
    }

    .auth-footer a:hover {
      text-decoration: underline;
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

  <!-- LOGIN WRAPPER -->
  <main class="auth-wrapper">
    <div class="auth-bg-mask abm-1"></div>
    <div class="auth-bg-mask abm-2"></div>

    <div class="auth-card">
      <div class="auth-header">
        <span class="auth-eyebrow">WELCOME BACK</span>
        <h1 class="auth-title">LOGIN</h1>
      </div>

      <form action="loginServlet" method="post">
        <div class="form-group">
          <label class="form-label" for="email">EMAIL ADDRESS</label>
          <input type="email" id="email" name="email" class="form-input" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
          <label class="form-label" for="password">PASSWORD</label>
          <input type="password" id="password" name="password" class="form-input" placeholder="Enter your password" required>
        </div>

        <div class="form-row">
          <label class="remember-wrap">
            <input type="checkbox" name="remember"> REMEMBER ME
          </label>
          <a href="#" class="forgot-link">FORGOT PASSWORD?</a>
        </div>

        <button type="submit" class="btn-submit">LOGIN â¸</button>
      </form>

      <div class="divider-wrap">
        <div class="divider-line"></div>
        <span class="divider-text">OR</span>
        <div class="divider-line"></div>
      </div>

      <div class="social-actions">
        <button class="social-btn">
          <!-- Styled Google G -->
          <span style="color: var(--impossible-red); font-weight: 900;">G</span> CONTINUE WITH GOOGLE
        </button>
      </div>

      <div class="auth-footer">
        NEW TO FEASTS? <a href="register.jsp">CREATE AN ACCOUNT</a>
      </div>
    </div>
  </main>

</body>
</html>

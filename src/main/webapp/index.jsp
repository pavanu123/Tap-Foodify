<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tap.model.User" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Bengaluru Feasts - Premium Online Food Delivery Platform. Experience authentic Bangalore dining delivered at bold speed.">
  <title>BENGALURU FEASTS â BOLD FLAVORS DELIVERED</title>
  <!-- Google Fonts: Oswald for condensed display headlines, Inter for clean body text -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Oswald:wght@500;700;900&display=swap" rel="stylesheet">
  <style>
    /* IMPOSSIBLE FOODS STYLE DESIGN TOKENS */
    :root {
      /* Surfaces & Colors */
      --velvet-wine: #260212;
      --burgundy-stage: #4f0423;
      --impossible-red: #e10600;
      --blush-highlight: #ffc7c6;
      --black: #000000;
      --white: #ffffff;
      
      /* Spacing Scale */
      --spacing-4: 4px;
      --spacing-8: 8px;
      --spacing-12: 12px;
      --spacing-16: 16px;
      --spacing-20: 20px;
      --spacing-24: 24px;
      --spacing-32: 32px;
      --spacing-40: 40px;
      --spacing-56: 56px;
      --spacing-64: 64px;
      --spacing-80: 80px;
      --spacing-100: 100px;
      --spacing-148: 148px;

      /* Radius */
      --radius-nav: 15px;
      --radius-cards: 12px;
      --radius-buttons: 15px;
      --radius-toggles: 15px;
      --radius-feature-cards: 38px;
      
      /* Typography */
      --font-display: 'Oswald', 'Arial Black', sans-serif;
      --font-sans: 'Inter', sans-serif;
      
      --transition: all 0.2s ease-out;
      --max-width: 1280px;
    }

    /* Reset & Base Styles */
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
      overflow-x: hidden;
    }

    a {
      text-decoration: none;
      color: inherit;
      transition: var(--transition);
    }

    ul {
      list-style: none;
    }

    .container {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 var(--spacing-24);
    }

    /* ====== STICKY TOP NAVIGATION ====== */
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
      display: flex;
      align-items: center;
      gap: 4px;
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

    /* Button Patterns matching Style Guide */
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

    /* ====== HERO DISPLAY BLOCK ====== */
    .hero {
      position: relative;
      padding: var(--spacing-80) 0;
      text-align: center;
      overflow: hidden;
      background-color: var(--velvet-wine);
    }

    .hero-eyebrow {
      font-family: var(--font-display);
      font-size: var(--spacing-16);
      font-weight: 700;
      color: var(--blush-highlight);
      letter-spacing: 4px;
      text-transform: uppercase;
      margin-bottom: var(--spacing-16);
    }

    .hero-title {
      font-family: var(--font-display);
      font-size: 100px;
      line-height: 0.8;
      font-weight: 900;
      color: var(--impossible-red);
      text-transform: uppercase;
      letter-spacing: 0.04em;
      margin-bottom: var(--spacing-32);
    }

    .hero-title span {
      color: var(--white);
      display: block;
      font-size: 110px;
    }

    .hero-asides {
      font-family: var(--font-display);
      font-size: 20px;
      font-weight: 700;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-40);
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    /* Search Component */
    .search-block {
      max-width: 600px;
      margin: 0 auto;
      display: flex;
      align-items: center;
      background-color: var(--black);
      border: 1px solid var(--impossible-red);
      border-radius: var(--radius-buttons);
      padding: 6px;
    }

    .search-location {
      padding: 0 var(--spacing-16);
      font-family: var(--font-display);
      font-size: 14px;
      color: var(--blush-highlight);
      font-weight: 700;
      border-right: 1px solid rgba(255, 255, 255, 0.15);
      white-space: nowrap;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .search-input-wrap {
      flex: 1;
      padding-left: var(--spacing-12);
    }

    .search-input-wrap input {
      width: 100%;
      background: transparent;
      border: none;
      outline: none;
      color: var(--white);
      font-family: var(--font-sans);
      font-size: 15px;
    }

    .search-input-wrap input::placeholder {
      color: rgba(255, 255, 255, 0.4);
    }

    /* Organic Masked Image Overlays */
    .masked-food {
      position: absolute;
      width: 220px;
      height: 220px;
      pointer-events: none;
      z-index: 1;
      opacity: 0.85;
      /* Hexagonal blob mask matching style guide */
      clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
    }

    .mf-1 {
      top: var(--spacing-56);
      left: -50px;
      background-color: var(--burgundy-stage);
    }

    .mf-2 {
      bottom: var(--spacing-56);
      right: -50px;
      background-color: var(--burgundy-stage);
    }

    /* ====== SECTION HEADER WITH BRACKET ACCENTS ====== */
    .section-header-wrap {
      text-align: center;
      margin-bottom: var(--spacing-56);
    }

    .section-eyebrow {
      font-family: var(--font-display);
      font-size: 15px;
      font-weight: 700;
      color: var(--impossible-red);
      letter-spacing: 3px;
      text-transform: uppercase;
      margin-bottom: var(--spacing-8);
      display: block;
    }

    .section-title-huge {
      font-family: var(--font-display);
      font-size: 64px;
      line-height: 0.85;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 0.02em;
    }

    .section-title-huge span {
      color: var(--impossible-red);
    }

    /* ====== FILTER PILL TOGGLES ====== */
    .filter-toggles-wrap {
      display: flex;
      justify-content: center;
      gap: var(--spacing-12);
      flex-wrap: wrap;
      margin-bottom: var(--spacing-40);
    }

    .filter-pill {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      padding: 10px 20px;
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

    /* ====== PRODUCT CAROUSEL / CATEGORY ROW ====== */
    .collections-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-80);
    }

    .collection-item {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-20);
      text-align: center;
      transition: var(--transition);
    }

    .collection-item:hover {
      border-color: var(--impossible-red);
    }

    .collection-img-wrap {
      position: relative;
      width: 140px;
      height: 140px;
      margin: 0 auto var(--spacing-16);
      clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
    }

    .collection-img-wrap img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .collection-name {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: var(--spacing-8);
    }

    .collection-desc {
      font-size: 12px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    /* ====== POPULAR RESTAURANTS GRID ====== */
    .grid-container {
      padding-bottom: var(--spacing-80);
    }

    .restaurants-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: var(--spacing-32);
    }

    .rest-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      overflow: hidden;
      transition: var(--transition);
    }

    .rest-card:hover {
      border-color: var(--impossible-red);
    }

    .rest-img-block {
      height: 200px;
      position: relative;
    }

    .rest-img-block img {
      width: 100%;
      height: 100%;
      object-fit: cover;
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
      margin-bottom: var(--spacing-16);
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

    /* ====== FEATURED RESTAURANT (38px RADIUS) ====== */
    .featured-section {
      background-color: var(--burgundy-stage);
      border: 1.5px solid var(--impossible-red);
      border-radius: var(--radius-feature-cards);
      padding: var(--spacing-40);
      margin-bottom: var(--spacing-80);
      display: flex;
      gap: var(--spacing-40);
      align-items: center;
    }

    .featured-img-wrap {
      flex: 1;
      height: 300px;
      clip-path: polygon(50% 0%, 93% 20%, 93% 80%, 50% 100%, 7% 80%, 7% 20%);
    }

    .featured-img-wrap img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .featured-info {
      flex: 1.2;
    }

    .featured-label {
      font-family: var(--font-display);
      font-size: 12px;
      font-weight: 700;
      color: var(--impossible-red);
      letter-spacing: 3px;
      text-transform: uppercase;
      margin-bottom: var(--spacing-8);
      display: block;
    }

    .featured-title {
      font-family: var(--font-display);
      font-size: 40px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      margin-bottom: var(--spacing-16);
      line-height: 1;
    }

    .featured-desc {
      font-size: 15px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-24);
    }

    .featured-meta {
      display: flex;
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-32);
    }

    .featured-meta-item {
      display: flex;
      flex-direction: column;
    }

    .f-meta-lbl {
      font-size: 11px;
      color: var(--blush-highlight);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 2px;
    }

    .f-meta-val {
      font-family: var(--font-display);
      font-size: 16px;
      font-weight: 700;
      color: var(--white);
    }

    /* ====== TRENDING FOODS GRID ====== */
    .trending-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-80);
    }

    .food-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      overflow: hidden;
      transition: var(--transition);
      display: flex;
      flex-direction: column;
    }

    .food-card:hover {
      border-color: var(--impossible-red);
    }

    .food-img-block {
      height: 180px;
      position: relative;
    }

    .food-img-block img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .food-body {
      padding: var(--spacing-20);
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .food-title {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      margin-bottom: var(--spacing-4);
    }

    .food-restaurant {
      font-size: 12px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    .food-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .food-price {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 900;
      color: var(--white);
    }

    /* ====== OFFERS BANNER SLIDER ====== */
    .offers-wrap {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-80);
    }

    .offer-card-large {
      background-color: var(--burgundy-stage);
      border: 2px dashed var(--impossible-red);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
      display: flex;
      justify-content: space-between;
      align-items: center;
      transition: var(--transition);
    }

    .offer-card-large:hover {
      border-color: var(--white);
    }

    .offer-info-large h3 {
      font-family: var(--font-display);
      font-size: 32px;
      font-weight: 900;
      color: var(--white);
      line-height: 1;
      margin-bottom: var(--spacing-8);
      text-transform: uppercase;
    }

    .offer-info-large p {
      font-size: 13px;
      color: var(--blush-highlight);
      margin-bottom: var(--spacing-16);
    }

    .offer-code-badge {
      display: inline-block;
      border: 1px dashed var(--blush-highlight);
      padding: 6px var(--spacing-16);
      font-family: var(--font-display);
      font-size: 13px;
      color: var(--white);
      font-weight: 700;
      border-radius: var(--radius-toggles);
    }

    /* ====== WHY CHOOSE US ====== */
    .why-choose-us {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-80);
    }

    .why-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32) var(--spacing-24);
      text-align: center;
    }

    .why-icon {
      font-size: 40px;
      margin-bottom: var(--spacing-16);
    }

    .why-card h3 {
      font-family: var(--font-display);
      font-size: 18px;
      font-weight: 900;
      color: var(--white);
      text-transform: uppercase;
      margin-bottom: var(--spacing-8);
    }

    .why-card p {
      font-size: 13px;
      color: var(--blush-highlight);
      line-height: 1.6;
    }

    /* ====== CUSTOMER REVIEWS ====== */
    .reviews-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: var(--spacing-24);
      margin-bottom: var(--spacing-80);
    }

    .review-card {
      background-color: var(--burgundy-stage);
      border: 1px solid var(--black);
      border-radius: var(--radius-cards);
      padding: var(--spacing-32);
    }

    .review-quote {
      font-size: 32px;
      color: var(--impossible-red);
      line-height: 1;
      margin-bottom: var(--spacing-12);
    }

    .review-text {
      font-size: 14px;
      font-style: italic;
      color: var(--white);
      margin-bottom: var(--spacing-20);
      line-height: 1.6;
    }

    .review-user {
      display: flex;
      align-items: center;
      gap: var(--spacing-12);
    }

    .review-avatar {
      width: 44px;
      height: 44px;
      border-radius: 50%;
      background-color: var(--impossible-red);
      color: var(--white);
      font-family: var(--font-display);
      font-weight: 700;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .review-username {
      font-family: var(--font-display);
      font-size: 14px;
      font-weight: 700;
      color: var(--white);
      text-transform: uppercase;
    }

    .review-rating-stars {
      color: var(--impossible-red);
      font-size: 12px;
    }

    /* ====== DOWNLOAD APP BANNER ====== */
    .app-banner-section {
      margin-bottom: var(--spacing-80);
    }

    .app-banner-section img {
      width: 100%;
      display: block;
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
    @media (max-width: 1024px) {
      .restaurants-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      .collections-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      .trending-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      .why-choose-us {
        grid-template-columns: repeat(2, 1fr);
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
      /* Checkbox hack display mobile menu */
      .nav-toggle:checked ~ .nav-menu-mobile {
        display: flex;
      }

      .hero-title {
        font-size: 56px;
      }
      .hero-title span {
        font-size: 64px;
      }
      .section-title-huge {
        font-size: 40px;
      }
      .featured-section {
        flex-direction: column;
        padding: var(--spacing-24);
      }
      .featured-img-wrap {
        width: 100%;
        height: 200px;
      }
      .restaurants-grid, .collections-grid, .trending-grid, .why-choose-us, .reviews-grid {
        grid-template-columns: 1fr;
      }
      .footer-grid {
        grid-template-columns: 1fr;
      }
      .offers-wrap {
        grid-template-columns: 1fr;
      }
    }

    /* Mobile menu styles */
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
  </style>
</head>
<body>



  <!-- STICKY TOP NAVIGATION -->
  <nav class="navbar">
    <div class="container nav-inner">
      <a href="index.jsp" class="nav-logo">BENGALURU <span>FEASTS</span></a>

      <!-- Desktop Menu -->
      <ul class="nav-menu">
        <li><a href="index.jsp" class="nav-link active">Home</a></li>
        <li><a href="restaurant" class="nav-link">Restaurants</a></li>
        <li><a href="#" class="nav-link">Collections</a></li>
        <li><a href="profile.jsp" class="nav-link no-caret">Profile</a></li>
      </ul>

      <div class="nav-actions">
        <a href="cart.jsp" class="btn-ghost cart-btn no-caret">
          &#128092; CART
          <span class="cart-badge">3</span>
        </a>
<%
User user = (User) session.getAttribute("loggedInUser");

    if (user != null) {
%>
    <a href="profile.jsp" class="btn-primary"> Hi,
        <%= user.getUserName() %>
    </a>
<%
    } else {
%>
    <a href="login.jsp" class="btn-primary">
        Login
    </a>
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

  <!-- HERO DISPLAY BLOCK -->
  <header class="hero">
    <div class="masked-food mf-1"></div>
    <div class="masked-food mf-2"></div>
    <div class="container">
      <h4 class="hero-eyebrow">THE LEGENDARY FLAVORS OF BENGALURU</h4>
      <h1 class="hero-title">AUTHENTIC DOSA<span>&amp; BOLD BIRYANI</span></h1>
      <p class="hero-asides">(DELIVERED AT BOLD SPEED TO YOUR DOORSTEP)</p>

      <!-- Beautiful Search Section -->
      <form class="search-block" action="restaurant">
        <div class="search-location">
          &#128205; Bangalore, KA
        </div>
        <div class="search-input-wrap">
          <input type="text" placeholder="Search MTR Dosa, Meghana Biryani, Truffles burgers..." aria-label="Food search">
        </div>
        <button type="submit" class="btn-primary">SEARCH â¸</button>
      </form>
    </div>
  </header>

  <!-- FOOD CATEGORIES / COLLECTIONS -->
  <section class="container" style="padding-top: var(--spacing-80);">
    <div class="section-header-wrap">
      <span class="section-eyebrow">â WHAT'S ON YOUR MIND? â¸</span>
      <h2 class="section-title-huge">EXPLORE <span>COLLECTIONS</span></h2>
    </div>
    
    <div class="collections-grid">
      <a href="restaurant?category=south-indian" class="collection-item">
        <div class="collection-img-wrap">
          <img src="assets/images/food/masala_dosa.jpg" alt="South Indian Food">
        </div>
        <h4 class="collection-name">South Indian</h4>
        <p class="collection-desc">Crispy Dosas &amp; Steaming Idlis</p>
      </a>
      
      <a href="restaurant?category=biryani" class="collection-item">
        <div class="collection-img-wrap">
          <img src="assets/images/food/andhra_biryani.jpg" alt="Biryani">
        </div>
        <h4 class="collection-name">Biryani</h4>
        <p class="collection-desc">Spicy Andhra &amp; Dum rice</p>
      </a>

      <a href="restaurant?category=burgers" class="collection-item">
        <div class="collection-img-wrap">
          <img src="assets/images/food/truffles_burger.jpg" alt="Burgers">
        </div>
        <h4 class="collection-name">Burgers</h4>
        <p class="collection-desc">Juicy premium grilled patties</p>
      </a>

      <a href="restaurant?category=pizza" class="collection-item">
        <div class="collection-img-wrap">
          <img src="assets/images/food/pepperoni_pizza.jpg" alt="Pizza">
        </div>
        <h4 class="collection-name">Pizza</h4>
        <p class="collection-desc">Woodfired sourdough slices</p>
      </a>
    </div>
  </section>

  <!-- FEATURED RESTAURANT (38px RADIUS) -->
  <section class="container">
    <div class="featured-section">
      <div class="featured-img-wrap">
        <img src="assets/images/restaurants/mtr.jpg" alt="Mavalli Tiffin Room">
      </div>
      <div class="featured-info">
        <span class="featured-label">â LEGEND OF BENGALURU</span>
        <h3 class="featured-title">MAVALLI TIFFIN ROOM</h3>
        <p class="featured-desc">Serving authentic, legendary Karnataka breakfast since 1924. Famous for developing the Rava Idli during WWII and pristine filter coffee.</p>
        <div class="featured-meta">
          <div class="featured-meta-item">
            <span class="f-meta-lbl">Rating</span>
            <span class="f-meta-val">â 4.8</span>
          </div>
          <div class="featured-meta-item">
            <span class="f-meta-lbl">Time</span>
            <span class="f-meta-val">25 MINS</span>
          </div>
          <div class="featured-meta-item">
            <span class="f-meta-lbl">Cost</span>
            <span class="f-meta-val">â¹250 FOR TWO</span>
          </div>
        </div>
        <a href="menu.jsp#mtr" class="btn-primary">ORDER NOW â¸</a>
      </div>
    </div>
  </section>

  <!-- POPULAR RESTAURANTS LISTING -->
  <section class="container grid-container">
    <div class="section-header-wrap">
      <span class="section-eyebrow">â BANNER DINING OPTIONS â¸</span>
      <h2 class="section-title-huge">POPULAR <span>RESTAURANTS</span></h2>
    </div>

    <div class="filter-toggles-wrap">
      <button class="filter-pill active">All Options</button>
      <button class="filter-pill">Top Rated</button>
      <button class="filter-pill">Pure Veg</button>
      <button class="filter-pill">Late Night</button>
      <button class="filter-pill">Fast Delivery</button>
    </div>

    <div class="restaurants-grid">
      <!-- MTR -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/mtr.jpg" alt="Mavalli Tiffin Room">
          <span class="offer-ribbon">NO DELIVERY FEE</span>
          <span class="delivery-time">25 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Mavalli Tiffin Room</h3>
            <span class="rest-rating">â 4.8</span>
          </div>
          <p class="rest-cuisines">South Indian, Filter Coffee, Breakfast</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹250 FOR TWO</span>
            <a href="menu.jsp#mtr" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>

      <!-- Vidyarthi Bhavan -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/vidyarthi_bhavan.jpg" alt="Vidyarthi Bhavan">
          <span class="offer-ribbon">FLAT 20% OFF</span>
          <span class="delivery-time">30 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Vidyarthi Bhavan</h3>
            <span class="rest-rating">â 4.7</span>
          </div>
          <p class="rest-cuisines">Benne Masala Dosa, Idli, South Indian</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹150 FOR TWO</span>
            <a href="menu.jsp#vidyarthi-bhavan" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>

      <!-- Empire Restaurant -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/empire.jpg" alt="Empire Restaurant">
          <span class="offer-ribbon">FREE DRINK</span>
          <span class="delivery-time">20 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Empire Restaurant</h3>
            <span class="rest-rating">â 4.3</span>
          </div>
          <p class="rest-cuisines">Mughlai, North Indian, Kebabs, Late Night</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹300 FOR TWO</span>
            <a href="menu.jsp#empire" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>

      <!-- Truffles -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/truffles.jpg" alt="Truffles">
          <span class="offer-ribbon">FLAT â¹100 OFF</span>
          <span class="delivery-time">28 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Truffles</h3>
            <span class="rest-rating">â 4.5</span>
          </div>
          <p class="rest-cuisines">Burgers, Cafe, Fast Food, Desserts</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹400 FOR TWO</span>
            <a href="menu.jsp#truffles" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>

      <!-- Nagarjuna -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/nagarjuna.jpg" alt="Nagarjuna">
          <span class="offer-ribbon">FLAT 15% OFF</span>
          <span class="delivery-time">35 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Nagarjuna</h3>
            <span class="rest-rating">â 4.4</span>
          </div>
          <p class="rest-cuisines">Andhra Meals, Biryani, Spicy Kebabs</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹500 FOR TWO</span>
            <a href="menu.jsp#nagarjuna" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>

      <!-- Corner House -->
      <div class="rest-card">
        <div class="rest-img-block">
          <img src="assets/images/restaurants/corner_house.jpg" alt="Corner House">
          <span class="offer-ribbon">BOGO OFFER</span>
          <span class="delivery-time">15 MINS</span>
        </div>
        <div class="rest-body">
          <div class="rest-title-row">
            <h3 class="rest-title">Corner House</h3>
            <span class="rest-rating">â 4.9</span>
          </div>
          <p class="rest-cuisines">Ice Cream Fudge, Chocolate Shakes, Desserts</p>
          <div class="rest-footer">
            <span class="rest-price-info">â¹300 FOR TWO</span>
            <a href="menu.jsp#corner-house" class="btn-ghost">VIEW MENU â¸</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- TRENDING DISHES -->
  <section class="container">
    <div class="section-header-wrap">
      <span class="section-eyebrow">â BANGLOREAN FAVORITES â¸</span>
      <h2 class="section-title-huge">TRENDING <span>DISHES</span></h2>
    </div>

    <div class="trending-grid">
      <!-- Dosa -->
      <div class="food-card">
        <div class="food-img-block">
          <img src="assets/images/food/masala_dosa.jpg" alt="Masala Dosa">
        </div>
        <div class="food-body">
          <div>
            <h3 class="food-title">Benne Masala Dosa</h3>
            <p class="food-restaurant">CTR Shree Sagar</p>
          </div>
          <div class="food-footer">
            <span class="food-price">â¹90</span>
            <a href="menu.jsp#ctr" class="btn-primary">ADD â¸</a>
          </div>
        </div>
      </div>

      <!-- Biryani -->
      <div class="food-card">
        <div class="food-img-block">
          <img src="assets/images/food/andhra_biryani.jpg" alt="Chicken Biryani">
        </div>
        <div class="food-body">
          <div>
            <h3 class="food-title">Andhra Chicken Biryani</h3>
            <p class="food-restaurant">Meghana Foods</p>
          </div>
          <div class="food-footer">
            <span class="food-price">â¹280</span>
            <a href="menu.jsp#meghana" class="btn-primary">ADD â¸</a>
          </div>
        </div>
      </div>

      <!-- Burger -->
      <div class="food-card">
        <div class="food-img-block">
          <img src="assets/images/food/truffles_burger.jpg" alt="Burger">
        </div>
        <div class="food-body">
          <div>
            <h3 class="food-title">Crispy Chicken Burger</h3>
            <p class="food-restaurant">Truffles Cafe</p>
          </div>
          <div class="food-footer">
            <span class="food-price">â¹180</span>
            <a href="menu.jsp#truffles" class="btn-primary">ADD â¸</a>
          </div>
        </div>
      </div>

      <!-- Dessert -->
      <div class="food-card">
        <div class="food-img-block">
          <img src="assets/images/food/death_by_chocolate.jpg" alt="Death by Chocolate">
        </div>
        <div class="food-body">
          <div>
            <h3 class="food-title">Death by Chocolate</h3>
            <p class="food-restaurant">Corner House</p>
          </div>
          <div class="food-footer">
            <span class="food-price">â¹240</span>
            <a href="menu.jsp#corner-house" class="btn-primary">ADD â¸</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- EXCLUSIVE OFFERS -->
  <section class="container">
    <div class="offers-wrap">
      <div class="offer-card-large">
        <div class="offer-info-large">
          <h3>FIRST ORDER 50% OFF</h3>
          <p>Get flat 50% off on your first order. Up to â¹100 discount.</p>
          <span class="offer-code-badge">CODE: WELCOME50</span>
        </div>
      </div>
      <div class="offer-card-large">
        <div class="offer-info-large">
          <h3>FREE BENGALURU DELIVERIES</h3>
          <p>Free delivery from all top iconic cafes this weekend.</p>
          <span class="offer-code-badge">CODE: BLRFREE</span>
        </div>
      </div>
    </div>
  </section>

  <!-- WHY CHOOSE US -->
  <section class="container">
    <div class="why-choose-us">
      <div class="why-card">
        <div class="why-icon">â¡</div>
        <h3>BOLD SPEED</h3>
        <p>Your food delivered piping hot in under 30 minutes, backed by our local logistics engine.</p>
      </div>
      <div class="why-card">
        <div class="why-icon">ð¿</div>
        <h3>HYGIENE FIRST</h3>
        <p>All partner kitchens adhere to rigorous safety checks and sanitary packaging standards.</p>
      </div>
      <div class="why-card">
        <div class="why-icon">ð</div>
        <h3>ICONIC PARTNERS</h3>
        <p>Get exclusive access to order from Bengaluru legends like MTR, VB, Nagarjuna &amp; Corner House.</p>
      </div>
      <div class="why-card">
        <div class="why-icon">ð·ï¸</div>
        <h3>NO MARKUPS</h3>
        <p>Enjoy transparent menu pricing identical to restaurant dine-in rates with zero hidden fees.</p>
      </div>
    </div>
  </section>

  <!-- REVIEWS -->
  <section class="container">
    <div class="section-header-wrap">
      <span class="section-eyebrow">â WHAT BENGALUREANS SAY â¸</span>
      <h2 class="section-title-huge">CUSTOMER <span>REVIEWS</span></h2>
    </div>

    <div class="reviews-grid">
      <div class="review-card">
        <div class="review-quote">â</div>
        <p class="review-text">Ordering MTR's rava idli on Sunday morning used to mean waiting in lines for hours. Bengaluru Feasts gets it to my desk in Indiranagar in 20 minutes flat. Absolute game changer!</p>
        <div class="review-user">
          <div class="review-avatar">A</div>
          <div>
            <h5 class="review-username">Aditya Rao</h5>
            <div class="review-rating-stars">âââââ</div>
          </div>
        </div>
      </div>

      <div class="review-card">
        <div class="review-quote">â</div>
        <p class="review-text">Meghana Foods Biryani has always been my comfort food. The Andhra spice levels are perfectly preserved during delivery. Extremely neat packing too!</p>
        <div class="review-user">
          <div class="review-avatar">N</div>
          <div>
            <h5 class="review-username">Nisha Murthy</h5>
            <div class="review-rating-stars">âââââ</div>
          </div>
        </div>
      </div>

      <div class="review-card">
        <div class="review-quote">â</div>
        <p class="review-text">I ordered Corner House DBC. I was worried it would melt, but they packed it with cold insulation. It was as perfect as having it at the outlet.</p>
        <div class="review-user">
          <div class="review-avatar">K</div>
          <div>
            <h5 class="review-username">Karthik S.</h5>
            <div class="review-rating-stars">âââââ</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- DOWNLOAD APP BANNER -->
  <section class="container app-banner-section">
    <a href="#">
      <img src="assets/images/banners/app-banner.jpg" alt="Download Bengaluru Feasts App">
    </a>
  </section>

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

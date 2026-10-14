<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="index.aspx.cs"
    Inherits="textiles.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .home-page {
            max-width: 1240px;
            margin: 0 auto;
            padding: 30px 20px 60px;
        }

        /* ================= HERO BANNER ================= */
        .figma-hero {
            background: linear-gradient(135deg, #1967d2 0%, #124da0 100%);
            border-radius: 16px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #ffffff;
            margin-bottom: 35px;
            box-shadow: 0 10px 30px rgba(25, 103, 210, 0.18);
        }

        .hero-left {
            flex: 1;
            padding: 50px 45px;
        }

        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(255, 255, 255, 0.18);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 18px;
        }

        .hero-left h1 {
            font-size: 42px;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 16px;
        }

        .hero-left p {
            font-size: 16px;
            line-height: 1.6;
            color: rgba(255, 255, 255, 0.9);
            max-width: 520px;
            margin-bottom: 28px;
        }

        .hero-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: #ffffff;
            color: #1967d2;
            font-weight: 700;
            font-size: 15px;
            padding: 13px 28px;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
        }

        .hero-btn:hover {
            background: #f0f6ff;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.16);
        }

        .hero-right {
            width: 45%;
            height: 380px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-right img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: top center;
        }

        /* ================= SEARCH BOX ================= */
        .search-container {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 14px 20px;
            display: flex;
            gap: 12px;
            align-items: center;
            margin-bottom: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.04);
        }

        .search-container .search-icon {
            color: #94a3b8;
            font-size: 18px;
        }

        .search-input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            color: #1e293b;
            font-family: inherit;
        }

        .search-input::placeholder {
            color: #94a3b8;
        }

        .btn-clear {
            background: #f1f5f9;
            color: #475569;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-clear:hover {
            background: #e2e8f0;
        }

        .btn-search {
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
        }

        .btn-search:hover {
            background: #1557b0;
        }

        /* ================= SECTION HEADINGS ================= */
        .section-header {
            margin-bottom: 28px;
            position: relative;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
        }

        .section-header h2 {
            font-size: 24px;
            font-weight: 800;
            color: #1e293b;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .section-header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 90px;
            height: 2px;
            background: #1967d2;
        }

        /* ================= PRODUCTS GRID ================= */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(225px, 1fr));
            gap: 24px;
            margin-bottom: 45px;
        }

        .product-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border-color: #cbd5e1;
        }

        .product-img-wrapper {
            position: relative;
            height: 240px;
            background: #f8fafc;
            overflow: hidden;
        }

        .product-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .product-card:hover .product-img-wrapper img {
            transform: scale(1.06);
        }

        .product-stock-pill {
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(46, 125, 50, 0.9);
            color: #ffffff;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 8px;
            border-radius: 6px;
        }

        .product-body {
            padding: 16px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .product-category-name {
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .product-title {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 8px;
            line-height: 1.35;
            height: 40px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .product-pricing {
            display: flex;
            align-items: baseline;
            gap: 8px;
            margin-bottom: 14px;
        }

        .current-price {
            font-size: 18px;
            font-weight: 800;
            color: #1967d2;
        }

        .original-price {
            font-size: 13px;
            color: #94a3b8;
            text-decoration: line-through;
        }

        .product-card-actions {
            display: flex;
            gap: 8px;
            margin-top: auto;
        }

        .btn-view-details {
            flex: 1;
            background: #1967d2;
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            padding: 9px 0;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-view-details:hover {
            background: #1557b0;
        }

        .btn-add-cart-icon {
            background: #f1f5f9;
            color: #1967d2;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 9px 12px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .btn-add-cart-icon:hover {
            background: #1967d2;
            color: #ffffff;
            border-color: #1967d2;
        }

        /* ================= VIEW ALL BUTTON ================= */
        .view-all-container {
            text-align: center;
            margin-bottom: 55px;
        }

        .btn-view-all {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #ffffff;
            color: #1967d2;
            border: 2px solid #1967d2;
            padding: 12px 32px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-view-all:hover {
            background: #1967d2;
            color: #ffffff;
        }

        /* ================= PROMO SALE BANNER ================= */
        .promo-card {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            border-radius: 16px;
            padding: 40px 45px;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 50px;
        }

        .promo-info h3 {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 10px;
            color: #60a5fa;
        }

        .promo-info p {
            font-size: 15px;
            color: #cbd5e1;
        }

        .btn-promo-shop {
            background: #1967d2;
            color: #ffffff;
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-promo-shop:hover {
            background: #1557b0;
        }

        /* ================= STATS SECTION ================= */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 55px;
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
        }

        .stat-card i {
            font-size: 28px;
            color: #1967d2;
            margin-bottom: 12px;
        }

        .stat-card h4 {
            font-size: 28px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .stat-card p {
            font-size: 14px;
            color: #64748b;
            font-weight: 500;
        }

        /* ================= NEWSLETTER ================= */
        .newsletter-section {
            background: #eaf2fb;
            border: 1px solid #cce0f7;
            border-radius: 16px;
            padding: 45px 30px;
            text-align: center;
        }

        .newsletter-section h3 {
            font-size: 24px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .newsletter-section p {
            color: #475569;
            font-size: 15px;
            margin-bottom: 24px;
        }

        .newsletter-form-row {
            display: flex;
            max-width: 500px;
            margin: 0 auto;
            gap: 10px;
        }

        .newsletter-input {
            flex: 1;
            padding: 12px 18px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            background: #ffffff;
        }

        .btn-subscribe {
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-subscribe:hover {
            background: #1557b0;
        }

        .val-msg {
            display: block;
            margin-top: 8px;
            font-size: 13px;
        }

        @media (max-width: 850px) {
            .figma-hero {
                flex-direction: column;
                text-align: center;
            }
            .hero-right {
                width: 100%;
                height: 250px;
            }
            .hero-left {
                padding: 35px 25px;
            }
            .promo-card {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="home-page">
        <!-- FIGMA HERO BANNER -->
        <section class="figma-hero">
            <div class="hero-left">
                <span class="hero-tag"><i class="fa-solid fa-sparkles"></i> NEW ARRIVALS 2026</span>
                <h1>Men's Collection 2026</h1>
                <p>Discover premium graphic tees, hoodies, jackets, shirts and jeans. Upgrade your style today.</p>
                <a href="product.aspx" class="hero-btn">
                    <i class="fa-solid fa-bag-shopping"></i> Shop Now
                </a>
            </div>
            <div class="hero-right">
                <img src="images/hero_banner_figma.jpg" alt="Men's Collection 2026 Hero Banner" onerror="this.src='images/product_marble_tshirt.jpg'" />
            </div>
        </section>

        <!-- SEARCH BAR -->
        <div class="search-container">
            <i class="fa-solid fa-magnifying-glass search-icon"></i>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search products by name or category..."></asp:TextBox>
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-clear" OnClick="btnClear_Click" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
        </div>

        <!-- FEATURED MEN'S COLLECTION -->
        <div class="section-header">
            <h2><i class="fa-solid fa-fire" style="color: #1967d2;"></i> Featured Men's Collection</h2>
        </div>

        <div class="products-grid">
            <asp:Repeater ID="rptFeaturedProducts" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <div class="product-img-wrapper">
                            <span class="product-stock-pill"><i class="fa-solid fa-check"></i> In Stock</span>
                            <img src='<%# Eval("image_url") %>' alt='<%# Eval("name") %>' onerror="this.src='images/product_marble_tshirt.jpg'" />
                        </div>
                        <div class="product-body">
                            <div class="product-category-name"><%# Eval("category") %></div>
                            <h3 class="product-title" title='<%# Eval("name") %>'><%# Eval("name") %></h3>
                            <div class="product-pricing">
                                <span class="current-price">&#8377; <%# String.Format("{0:N0}", Eval("price")) %></span>
                                <span class="original-price">&#8377; <%# String.Format("{0:N0}", Eval("original_price")) %></span>
                            </div>
                            <div class="product-card-actions">
                                <a href='<%# "productdetails.aspx?id=" + Eval("id") %>' class="btn-view-details">
                                    <i class="fa-solid fa-eye"></i> View Details
                                </a>
                                <a href='<%# "cart.aspx?action=add&id=" + Eval("id") %>' class="btn-add-cart-icon" title="Add to Cart">
                                    <i class="fa-solid fa-cart-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- VIEW ALL PRODUCTS -->
        <div class="view-all-container">
            <a href="product.aspx" class="btn-view-all">
                <i class="fa-solid fa-store"></i> View All Products
            </a>
        </div>

        <!-- PROMO BANNER -->
        <div class="promo-card">
            <div class="promo-info">
                <h3><i class="fa-solid fa-tag"></i> Summer Sale 2026</h3>
                <p>Get up to 40% OFF on selected men's streetwear and classic designs.</p>
            </div>
            <a href="product.aspx" class="btn-promo-shop">
                <i class="fa-solid fa-cart-shopping"></i> Shop Sale
            </a>
        </div>

        <!-- STATS SECTION -->
        <div class="stats-grid">
            <div class="stat-card">
                <i class="fa-solid fa-users"></i>
                <h4>10K+</h4>
                <p>Happy Customers</p>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-shirt"></i>
                <h4>500+</h4>
                <p>Fashion Products</p>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-award"></i>
                <h4>50+</h4>
                <p>Premium Brands</p>
            </div>
        </div>

        <!-- NEWSLETTER SUBSCRIPTION (ASP.NET VALIDATION) -->
        <div class="newsletter-section">
            <h3><i class="fa-regular fa-paper-plane" style="color: #1967d2;"></i> Stay in Touch</h3>
            <p>Subscribe for exclusive drops, early bird offers, and style updates.</p>
            <div class="newsletter-form-row">
                <asp:TextBox ID="txtNewsletterEmail" runat="server" CssClass="newsletter-input" placeholder="Enter your email address"></asp:TextBox>
                <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn-subscribe" OnClick="btnSubscribe_Click" ValidationGroup="NewsletterGroup" />
            </div>
            <asp:RequiredFieldValidator ID="rfvNewsletter" runat="server" 
                ControlToValidate="txtNewsletterEmail" 
                ErrorMessage="Please enter your email." 
                ForeColor="#d32f2f" 
                Display="Dynamic" 
                CssClass="val-msg"
                ValidationGroup="NewsletterGroup" />
            <asp:RegularExpressionValidator ID="revNewsletter" runat="server" 
                ControlToValidate="txtNewsletterEmail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ErrorMessage="Please enter a valid email address." 
                ForeColor="#d32f2f" 
                Display="Dynamic" 
                CssClass="val-msg"
                ValidationGroup="NewsletterGroup" />
            <asp:Label ID="lblNewsletterMsg" runat="server" ForeColor="#2e7d32" Font-Bold="true" Visible="false" CssClass="val-msg"></asp:Label>
        </div>
    </div>
</asp:Content>
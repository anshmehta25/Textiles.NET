<%@ Page Title="Men's Collection"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="product.aspx.cs"
    Inherits="textiles.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .collection-page {
            max-width: 1240px;
            margin: 0 auto;
            padding: 30px 20px 60px;
        }

        /* ================= CATEGORY HERO SHOWCASE ================= */
        .category-hero {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            display: flex;
            align-items: center;
            margin-bottom: 35px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        .category-hero-img {
            width: 38%;
            height: 280px;
            overflow: hidden;
        }

        .category-hero-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: top center;
        }

        .category-hero-content {
            flex: 1;
            padding: 35px 40px;
        }

        .category-tag {
            display: inline-block;
            background: #eaf2fb;
            color: #1967d2;
            font-size: 12px;
            font-weight: 700;
            padding: 5px 12px;
            border-radius: 20px;
            margin-bottom: 12px;
            letter-spacing: 0.5px;
        }

        .category-hero-content h1 {
            font-size: 32px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 10px;
        }

        .category-hero-content p {
            color: #64748b;
            font-size: 15px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .category-stats-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .stat-pill {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .stat-pill i {
            color: #1967d2;
        }

        .btn-explore {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #1967d2;
            color: #ffffff;
            padding: 11px 24px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14px;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-explore:hover {
            background: #1557b0;
        }

        /* ================= FILTER / SEARCH BAR ================= */
        .filter-bar {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px 24px;
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 35px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
        }

        .filter-search-box {
            flex: 2;
            min-width: 220px;
            position: relative;
        }

        .filter-search-box i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .filter-input {
            width: 100%;
            padding: 10px 14px 10px 38px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            font-family: inherit;
        }

        .filter-input:focus {
            border-color: #1967d2;
        }

        .filter-select {
            flex: 1;
            min-width: 160px;
            padding: 10px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            background: #ffffff;
            font-family: inherit;
            color: #334155;
        }

        .btn-filter-apply {
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 10px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-filter-apply:hover {
            background: #1557b0;
        }

        .btn-filter-clear {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-filter-clear:hover {
            background: #e2e8f0;
        }

        /* ================= PRODUCTS HEADER ================= */
        .products-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
            position: relative;
        }

        .products-section-header h2 {
            font-size: 24px;
            font-weight: 800;
            color: #1e293b;
        }

        .products-section-header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 80px;
            height: 2px;
            background: #1967d2;
        }

        /* ================= PRODUCTS GRID ================= */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(225px, 1fr));
            gap: 24px;
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

        @media (max-width: 850px) {
            .category-hero {
                flex-direction: column;
            }
            .category-hero-img {
                width: 100%;
                height: 220px;
            }
            .category-hero-content {
                padding: 25px;
            }
            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>

    <div class="collection-page">
        <!-- CATEGORY HERO SHOWCASE (FIGMA FIGURE 3) -->
        <section class="category-hero">
            <div class="category-hero-img">
                <img src="images/men_category_model.jpg" alt="Men's Collection Fashion Model" onerror="this.src='images/product_marble_tshirt.jpg'" />
            </div>
            <div class="category-hero-content">
                <span class="category-tag"><i class="fa-solid fa-crown"></i> MEN'S EXCLUSIVE</span>
                <h1>Men's Clothing</h1>
                <p>Explore our signature collection designed exclusively for men. From graphic tees to premium fleece hoodies, varsity jackets, and tailored denim.</p>
                <div class="category-stats-row">
                    <span class="stat-pill"><i class="fa-solid fa-shirt"></i> 2 T-Shirts</span>
                    <span class="stat-pill"><i class="fa-solid fa-vest"></i> 1 Hoodie</span>
                    <span class="stat-pill"><i class="fa-solid fa-shield"></i> 1 Jacket</span>
                    <span class="stat-pill"><i class="fa-solid fa-socks"></i> 1 Jeans</span>
                </div>
                <a href="#all-products" class="btn-explore">
                    <i class="fa-solid fa-arrow-down"></i> Explore Collection
                </a>
            </div>
        </section>

        <!-- FILTER & SEARCH BAR -->
        <div class="filter-bar">
            <div class="filter-search-box">
                <i class="fa-solid fa-magnifying-glass"></i>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input" placeholder="Search products..."></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="filter-select">
                <asp:ListItem Text="All Categories" Value="All" Selected="True"></asp:ListItem>
                <asp:ListItem Text="T-Shirts" Value="T-Shirts"></asp:ListItem>
                <asp:ListItem Text="Hoodies" Value="Hoodies"></asp:ListItem>
                <asp:ListItem Text="Jackets" Value="Jackets"></asp:ListItem>
                <asp:ListItem Text="Jeans" Value="Jeans"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlSort" runat="server" CssClass="filter-select">
                <asp:ListItem Text="Default Sorting" Value="default" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Price: Low to High" Value="price_asc"></asp:ListItem>
                <asp:ListItem Text="Price: High to Low" Value="price_desc"></asp:ListItem>
                <asp:ListItem Text="Highest Rated" Value="rating"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnFilter" runat="server" Text="Apply Filter" CssClass="btn-filter-apply" OnClick="btnFilter_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-filter-clear" OnClick="btnClear_Click" />
        </div>

        <!-- PRODUCTS SECTION HEADER -->
        <div id="all-products" class="products-section-header">
            <h2>All Products (<%= ProductCount %>)</h2>
        </div>

        <!-- PRODUCTS GRID -->
        <div class="products-grid">
            <asp:Repeater ID="rptProducts" runat="server">
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
    </div>
</asp:Content>
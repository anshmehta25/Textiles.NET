<%@ Page Title="Product Details"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="productdetails.aspx.cs"
    Inherits="textiles.productdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-details-container {
            max-width: 1180px;
            margin: 0 auto;
            padding: 25px 20px 60px;
        }

        /* ================= BREADCRUMB ================= */
        .breadcrumb-nav {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #64748b;
            margin-bottom: 25px;
        }

        .breadcrumb-nav a {
            color: #1967d2;
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb-nav a:hover {
            text-decoration: underline;
        }

        /* ================= MAIN PRODUCT CARD ================= */
        .details-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 40px;
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 45px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            margin-bottom: 35px;
        }

        .product-gallery {
            position: relative;
            background: #f8fafc;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 480px;
        }

        .product-gallery img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-info-panel {
            display: flex;
            flex-direction: column;
        }

        .product-badge-cat {
            display: inline-block;
            background: #eaf2fb;
            color: #1967d2;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 6px;
            letter-spacing: 0.5px;
            margin-bottom: 10px;
            align-self: flex-start;
        }

        .product-name-heading {
            font-size: 30px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 10px;
            line-height: 1.25;
        }

        .product-rating-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 18px;
        }

        .stars-gold {
            color: #f59e0b;
            font-size: 15px;
            display: flex;
            gap: 2px;
        }

        .rating-text {
            font-size: 14px;
            font-weight: 600;
            color: #475569;
        }

        .reviews-count {
            font-size: 13.5px;
            color: #94a3b8;
        }

        .price-section {
            display: flex;
            align-items: baseline;
            gap: 12px;
            margin-bottom: 16px;
        }

        .details-current-price {
            font-size: 32px;
            font-weight: 800;
            color: #1967d2;
        }

        .details-original-price {
            font-size: 18px;
            color: #94a3b8;
            text-decoration: line-through;
        }

        .discount-pill {
            background: #e8f5e9;
            color: #2e7d32;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 8px;
            border-radius: 6px;
        }

        .stock-indicator {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #2e7d32;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .product-desc-text {
            color: #475569;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e2e8f0;
        }

        /* ================= SELECTORS ================= */
        .selector-row {
            display: flex;
            gap: 25px;
            margin-bottom: 28px;
            align-items: flex-end;
            flex-wrap: wrap;
        }

        .selector-field label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .size-dropdown {
            padding: 10px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #1e293b;
            outline: none;
            background: #ffffff;
            min-width: 120px;
        }

        .qty-stepper {
            display: flex;
            align-items: center;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            overflow: hidden;
            width: 130px;
        }

        .qty-btn {
            background: #f8fafc;
            border: none;
            width: 38px;
            height: 42px;
            font-size: 18px;
            font-weight: 700;
            color: #475569;
            cursor: pointer;
            transition: background 0.2s;
        }

        .qty-btn:hover {
            background: #e2e8f0;
        }

        .qty-box {
            width: 54px;
            height: 42px;
            border: none;
            border-left: 1px solid #cbd5e1;
            border-right: 1px solid #cbd5e1;
            text-align: center;
            font-size: 15px;
            font-weight: 700;
            outline: none;
            color: #1e293b;
        }

        /* ================= ACTION BUTTONS ================= */
        .btn-action-row {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .btn-add-cart {
            flex: 1;
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 14px 20px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-add-cart:hover {
            background: #1557b0;
        }

        .btn-buy-now {
            flex: 1;
            background: #2e7d32;
            color: #ffffff;
            border: none;
            padding: 14px 20px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-buy-now:hover {
            background: #1b5e20;
        }

        /* ================= SPECS LIST ================= */
        .product-highlights {
            background: #f8fafc;
            border-radius: 10px;
            padding: 18px 22px;
            border: 1px solid #e2e8f0;
        }

        .product-highlights ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .product-highlights li {
            font-size: 13.5px;
            color: #475569;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .product-highlights li i {
            color: #1967d2;
            font-size: 12px;
        }

        @media (max-width: 850px) {
            .details-card {
                grid-template-columns: 1fr;
            }
            .product-gallery {
                height: 320px;
            }
            .btn-action-row {
                flex-direction: column;
            }
        }
    </style>

    <div class="product-details-container">
        <!-- BREADCRUMB -->
        <nav class="breadcrumb-nav">
            <a href="index.aspx">Home</a>
            <span>/</span>
            <a href="product.aspx">Men's Collection</a>
            <span>/</span>
            <span><asp:Label ID="lblTitle" runat="server"></asp:Label></span>
        </nav>

        <asp:Label ID="lblProductMsg" runat="server" Visible="false"></asp:Label>

        <!-- PRODUCT DETAILS CARD (FIGMA FIGURE 6) -->
        <div class="details-card">
            <!-- IMAGE GALLERY -->
            <div class="product-gallery">
                <asp:Image ID="imgProduct" runat="server" alt="Product Image" />
            </div>

            <!-- PRODUCT INFO -->
            <div class="product-info-panel">
                <span class="product-badge-cat"><asp:Label ID="lblCategory" runat="server"></asp:Label></span>
                <h1 class="product-name-heading"><%= lblTitle.Text %></h1>

                <div class="product-rating-row">
                    <div class="stars-gold">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <span class="rating-text"><asp:Label ID="lblRating" runat="server"></asp:Label> / 5</span>
                    <span class="reviews-count">(128 customer reviews)</span>
                </div>

                <div class="price-section">
                    <span class="details-current-price">&#8377; <asp:Label ID="lblPrice" runat="server"></asp:Label></span>
                    <span class="details-original-price">&#8377; <asp:Label ID="lblOriginalPrice" runat="server"></asp:Label></span>
                    <span class="discount-pill">33% OFF</span>
                </div>

                <div class="stock-indicator">
                    <i class="fa-solid fa-circle-check"></i> In Stock (40 units available)
                </div>

                <div class="product-desc-text">
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                </div>

                <!-- SELECTORS -->
                <div class="selector-row">
                    <div class="selector-field">
                        <label>Select Size</label>
                        <asp:DropDownList ID="ddlSize" runat="server" CssClass="size-dropdown">
                            <asp:ListItem Text="S - Small" Value="S"></asp:ListItem>
                            <asp:ListItem Text="M - Medium" Value="M" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="L - Large" Value="L"></asp:ListItem>
                            <asp:ListItem Text="XL - Extra Large" Value="XL"></asp:ListItem>
                            <asp:ListItem Text="XXL - Double Large" Value="XXL"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="selector-field">
                        <label>Quantity</label>
                        <div class="qty-stepper">
                            <button type="button" class="qty-btn" onclick="var q=document.getElementById('<%= txtQuantity.ClientID %>'); if(parseInt(q.value)>1) q.value=parseInt(q.value)-1;">-</button>
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="qty-box"></asp:TextBox>
                            <button type="button" class="qty-btn" onclick="var q=document.getElementById('<%= txtQuantity.ClientID %>'); if(parseInt(q.value)<10) q.value=parseInt(q.value)+1;">+</button>
                        </div>
                    </div>
                </div>

                <!-- ACTION BUTTONS -->
                <div class="btn-action-row">
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn-add-cart" OnClick="btnAddToCart_Click" />
                    <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn-buy-now" OnClick="btnBuyNow_Click" />
                </div>

                <!-- HIGHLIGHTS -->
                <div class="product-highlights">
                    <ul>
                        <li><i class="fa-solid fa-check"></i> 100% Bio-Washed Combed Cotton</li>
                        <li><i class="fa-solid fa-check"></i> Pre-Shrunk Fabric with Tailored Comfort Fit</li>
                        <li><i class="fa-solid fa-truck-fast"></i> Free Nationwide Delivery on orders over &#8377;499</li>
                        <li><i class="fa-solid fa-rotate-left"></i> 7 Days Hassle-Free Replacement Policy</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
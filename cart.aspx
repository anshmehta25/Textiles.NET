<%@ Page Title="Shopping Cart"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="cart.aspx.cs"
    Inherits="textiles.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cart-page {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px 70px;
        }

        .cart-title-row {
            margin-bottom: 30px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
            position: relative;
        }

        .cart-title-row h1 {
            font-size: 28px;
            font-weight: 800;
            color: #1e293b;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .cart-title-row::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 80px;
            height: 2px;
            background: #1967d2;
        }

        .cart-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            align-items: start;
        }

        /* ================= CART ITEMS TABLE ================= */
        .cart-table-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .cart-table th {
            background-color: #1967d2;
            color: #ffffff;
            font-weight: 700;
            font-size: 14px;
            padding: 14px 18px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .cart-table td {
            padding: 18px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
            font-size: 14.5px;
        }

        .product-cell {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .cart-thumb {
            width: 65px;
            height: 75px;
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            flex-shrink: 0;
        }

        .cart-item-info h4 {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .cart-item-size {
            font-size: 12.5px;
            color: #64748b;
        }

        .price-text {
            font-weight: 700;
            color: #1e293b;
        }

        .stepper-mini {
            display: inline-flex;
            align-items: center;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            overflow: hidden;
        }

        .step-btn {
            background: #f8fafc;
            border: none;
            width: 28px;
            height: 30px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            color: #334155;
            transition: background 0.2s;
        }

        .step-btn:hover {
            background: #e2e8f0;
        }

        .step-val {
            padding: 0 10px;
            font-weight: 700;
            font-size: 13.5px;
            color: #1e293b;
        }

        .subtotal-text {
            font-weight: 800;
            color: #1967d2;
        }

        .btn-remove-item {
            background: #fee2e2;
            color: #dc2626;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background 0.2s;
        }

        .btn-remove-item:hover {
            background: #fecaca;
        }

        .cart-table-footer {
            padding: 16px 20px;
            background: #f8fafc;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #e2e8f0;
        }

        .btn-continue-shop {
            background: #ffffff;
            color: #1967d2;
            border: 1.5px solid #1967d2;
            padding: 9px 18px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 13.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s;
        }

        .btn-continue-shop:hover {
            background: #1967d2;
            color: #ffffff;
        }

        .btn-clear-cart {
            background: #f1f5f9;
            color: #64748b;
            border: 1px solid #cbd5e1;
            padding: 9px 18px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 13.5px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-clear-cart:hover {
            background: #e2e8f0;
            color: #334155;
        }

        /* ================= ORDER SUMMARY CARD ================= */
        .order-summary-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 28px 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .order-summary-card h3 {
            font-size: 19px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
            font-size: 14.5px;
            color: #475569;
        }

        .summary-row.total-row {
            border-top: 1.5px dashed #cbd5e1;
            padding-top: 16px;
            margin-top: 16px;
            font-size: 18px;
            font-weight: 800;
            color: #1e293b;
        }

        .total-amount {
            color: #1967d2;
            font-size: 22px;
        }

        .free-shipping {
            color: #2e7d32;
            font-weight: 700;
        }

        .btn-checkout-primary {
            width: 100%;
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            margin-top: 24px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.2s;
            box-shadow: 0 4px 15px rgba(25, 103, 210, 0.2);
        }

        .btn-checkout-primary:hover {
            background: #1557b0;
        }

        /* ================= EMPTY STATE ================= */
        .empty-cart-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 70px 30px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .empty-cart-card i {
            font-size: 60px;
            color: #94a3b8;
            margin-bottom: 20px;
        }

        .empty-cart-card h2 {
            font-size: 24px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .empty-cart-card p {
            color: #64748b;
            font-size: 15px;
            margin-bottom: 25px;
        }

        @media (max-width: 850px) {
            .cart-layout {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="cart-page">
        <div class="cart-title-row">
            <h1><i class="fa-solid fa-cart-shopping" style="color: #1967d2;"></i> Shopping Cart</h1>
        </div>

        <asp:Panel ID="pnlCart" runat="server">
            <div class="cart-layout">
                <!-- CART ITEMS TABLE (FIGMA FIGURE 7) -->
                <div class="cart-table-card">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <div class="product-cell">
                                                <img src='<%# Eval("image_url") %>' alt='<%# Eval("product_name") %>' class="cart-thumb" onerror="this.src='images/product_marble_tshirt.jpg'" />
                                                <div class="cart-item-info">
                                                    <h4><%# Eval("product_name") %></h4>
                                                    <span class="cart-item-size">Size: <%# Eval("size") %></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="price-text">&#8377; <%# String.Format("{0:N0}", Eval("price")) %></span>
                                        </td>
                                        <td>
                                            <div class="stepper-mini">
                                                <asp:Button ID="btnDec" runat="server" Text="-" CssClass="step-btn" CommandName="Decrease" CommandArgument='<%# Eval("id") %>' />
                                                <span class="step-val"><%# Eval("quantity") %></span>
                                                <asp:Button ID="btnInc" runat="server" Text="+" CssClass="step-btn" CommandName="Increase" CommandArgument='<%# Eval("id") %>' />
                                            </div>
                                        </td>
                                        <td>
                                            <span class="subtotal-text">&#8377; <%# String.Format("{0:N0}", Convert.ToDecimal(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %></span>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn-remove-item" CommandName="Remove" CommandArgument='<%# Eval("id") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>

                    <div class="cart-table-footer">
                        <a href="product.aspx" class="btn-continue-shop">
                            <i class="fa-solid fa-arrow-left"></i> Continue Shopping
                        </a>
                        <asp:Button ID="btnClearCart" runat="server" Text="Clear Cart" CssClass="btn-clear-cart" OnClick="btnClearCart_Click" />
                    </div>
                </div>

                <!-- ORDER SUMMARY (FIGMA FIGURE 7) -->
                <div class="order-summary-card">
                    <h3>Order Summary</h3>
                    <div class="summary-row">
                        <span>Subtotal</span>
                        <span>&#8377; <asp:Label ID="lblSubtotal" runat="server">0</asp:Label></span>
                    </div>
                    <div class="summary-row">
                        <span>Shipping</span>
                        <span class="free-shipping">FREE</span>
                    </div>
                    <div class="summary-row">
                        <span>Estimated Tax (5% GST)</span>
                        <span>&#8377; <asp:Label ID="lblTax" runat="server">0</asp:Label></span>
                    </div>
                    <div class="summary-row total-row">
                        <span>Total Payable</span>
                        <span class="total-amount">&#8377; <asp:Label ID="lblTotal" runat="server">0</asp:Label></span>
                    </div>

                    <a href="checkout.aspx" class="btn-checkout-primary">
                        <i class="fa-solid fa-lock"></i> Proceed to Checkout
                    </a>
                </div>
            </div>
        </asp:Panel>

        <!-- EMPTY STATE -->
        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <div class="empty-cart-card">
                <i class="fa-solid fa-cart-arrow-down"></i>
                <h2>Your Shopping Cart is Empty</h2>
                <p>Looks like you haven't added any products to your cart yet.</p>
                <a href="product.aspx" class="btn-checkout-primary" style="display: inline-flex; width: auto; padding: 12px 30px;">
                    <i class="fa-solid fa-shirt"></i> Explore Men's Collection
                </a>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
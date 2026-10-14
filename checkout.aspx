<%@ Page Title="Secure Checkout"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="checkout.aspx.cs"
    Inherits="textiles.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .checkout-page {
            max-width: 1180px;
            margin: 0 auto;
            padding: 30px 20px 70px;
        }

        .checkout-header {
            margin-bottom: 30px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
            position: relative;
        }

        .checkout-header h1 {
            font-size: 28px;
            font-weight: 800;
            color: #1e293b;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .checkout-header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 80px;
            height: 2px;
            background: #1967d2;
        }

        .checkout-layout {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 30px;
            align-items: start;
        }

        /* ================= FORM CARDS ================= */
        .checkout-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 28px 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            margin-bottom: 25px;
        }

        .checkout-card h2 {
            font-size: 19px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-row {
            display: flex;
            gap: 16px;
            margin-bottom: 16px;
        }

        .form-col {
            flex: 1;
        }

        .checkout-field {
            margin-bottom: 16px;
        }

        .checkout-field label {
            display: block;
            font-size: 13.5px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
        }

        .checkout-input {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            color: #1e293b;
            outline: none;
            transition: border-color 0.2s;
        }

        .checkout-input:focus {
            border-color: #1967d2;
        }

        .val-err {
            display: block;
            color: #d32f2f;
            font-size: 12px;
            margin-top: 4px;
            font-weight: 500;
        }

        /* ================= PAYMENT METHODS ================= */
        .payment-radio-list table {
            width: 100%;
        }

        .payment-radio-list td {
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            margin-bottom: 10px;
            display: block;
            cursor: pointer;
            transition: border-color 0.2s;
        }

        .payment-radio-list td:has(input:checked) {
            border-color: #1967d2;
            background: #f0f7ff;
        }

        .payment-radio-list label {
            font-size: 14.5px;
            font-weight: 600;
            color: #1e293b;
            margin-left: 8px;
            cursor: pointer;
        }

        .payment-note {
            background: #f8fafc;
            border-left: 3px solid #1967d2;
            padding: 12px 16px;
            border-radius: 0 8px 8px 0;
            font-size: 13px;
            color: #475569;
            margin-top: 14px;
        }

        /* ================= ORDER SUMMARY ================= */
        .order-summary-box {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 28px 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .order-summary-box h3 {
            font-size: 19px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 18px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        .summary-items-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
            margin-bottom: 20px;
            max-height: 240px;
            overflow-y: auto;
        }

        .summary-item-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            font-size: 14px;
        }

        .summary-item-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .summary-thumb {
            width: 48px;
            height: 56px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
        }

        .summary-item-meta h5 {
            font-size: 14px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 2px;
        }

        .summary-item-meta span {
            font-size: 12px;
            color: #64748b;
        }

        .summary-item-price {
            font-weight: 700;
            color: #1e293b;
        }

        /* ================= COUPON BOX ================= */
        .coupon-row {
            display: flex;
            gap: 8px;
            margin-bottom: 16px;
        }

        .coupon-input {
            flex: 1;
            padding: 10px 14px;
            border: 1px dashed #94a3b8;
            border-radius: 6px;
            font-size: 13.5px;
            outline: none;
            text-transform: uppercase;
        }

        .btn-coupon-apply {
            background: #f1f5f9;
            color: #1967d2;
            border: 1px solid #cbd5e1;
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-coupon-apply:hover {
            background: #1967d2;
            color: #ffffff;
            border-color: #1967d2;
        }

        .coupon-feedback {
            font-size: 12.5px;
            font-weight: 600;
            display: block;
            margin-bottom: 12px;
        }

        /* ================= PRICE BREAKDOWN ================= */
        .breakdown-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
            color: #475569;
        }

        .breakdown-row.discount-text {
            color: #2e7d32;
            font-weight: 600;
        }

        .breakdown-row.total-bold {
            border-top: 1.5px dashed #cbd5e1;
            padding-top: 16px;
            margin-top: 16px;
            font-size: 18px;
            font-weight: 800;
            color: #1e293b;
        }

        .final-total-amount {
            color: #1967d2;
            font-size: 22px;
        }

        .btn-place-order-large {
            width: 100%;
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 15px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15.5px;
            margin-top: 22px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.2s;
            box-shadow: 0 4px 15px rgba(25, 103, 210, 0.2);
        }

        .btn-place-order-large:hover {
            background: #1557b0;
        }

        @media (max-width: 850px) {
            .checkout-layout {
                grid-template-columns: 1fr;
            }
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>

    <div class="checkout-page">
        <div class="checkout-header">
            <h1><i class="fa-solid fa-shield-halved" style="color: #1967d2;"></i> Secure Checkout</h1>
        </div>

        <asp:Label ID="lblCheckoutMsg" runat="server" Visible="false" ForeColor="#d32f2f" Font-Bold="true" style="margin-bottom: 20px; display: block;"></asp:Label>

        <div class="checkout-layout">
            <!-- LEFT COLUMN: FORMS -->
            <div class="checkout-forms">
                <!-- DELIVERY ADDRESS (FIGMA FIGURE 8) -->
                <div class="checkout-card">
                    <h2><i class="fa-solid fa-location-dot" style="color: #1967d2;"></i> Delivery Address</h2>

                    <div class="checkout-field">
                        <label>Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="checkout-input" placeholder="e.g. Tirth Kotak"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                            ControlToValidate="txtFullName" 
                            ErrorMessage="Please enter your full name." 
                            ForeColor="#d32f2f" 
                            Display="Dynamic" 
                            CssClass="val-err" 
                            ValidationGroup="CheckoutGroup" />
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="checkout-field">
                                <label>Phone Number *</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="checkout-input" placeholder="10-digit mobile number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" 
                                    ErrorMessage="Please enter phone number." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                                    ControlToValidate="txtPhone" 
                                    ValidationExpression="^[0-9]{10}$" 
                                    ErrorMessage="Please enter a valid 10-digit phone number." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                            </div>
                        </div>

                        <div class="form-col">
                            <div class="checkout-field">
                                <label>Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="checkout-input" placeholder="e.g. name@domain.com"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" 
                                    ErrorMessage="Please enter email." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                    ControlToValidate="txtEmail" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ErrorMessage="Please enter a valid email." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                            </div>
                        </div>
                    </div>

                    <div class="checkout-field">
                        <label>Street Address *</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="checkout-input" placeholder="House/Flat No., Building Name, Street Area"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                            ControlToValidate="txtAddress" 
                            ErrorMessage="Please enter delivery address." 
                            ForeColor="#d32f2f" 
                            Display="Dynamic" 
                            CssClass="val-err" 
                            ValidationGroup="CheckoutGroup" />
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="checkout-field">
                                <label>City *</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="checkout-input" placeholder="City"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                    ControlToValidate="txtCity" 
                                    ErrorMessage="City required." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="checkout-field">
                                <label>State *</label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="checkout-input" placeholder="State"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                                    ControlToValidate="txtState" 
                                    ErrorMessage="State required." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="checkout-field">
                                <label>PIN Code *</label>
                                <asp:TextBox ID="txtPincode" runat="server" CssClass="checkout-input" placeholder="PIN Code"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPincode" runat="server" 
                                    ControlToValidate="txtPincode" 
                                    ErrorMessage="PIN required." 
                                    ForeColor="#d32f2f" 
                                    Display="Dynamic" 
                                    CssClass="val-err" 
                                    ValidationGroup="CheckoutGroup" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PAYMENT METHOD (FIGMA FIGURE 8) -->
                <div class="checkout-card">
                    <h2><i class="fa-solid fa-credit-card" style="color: #1967d2;"></i> Payment Method</h2>

                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="payment-radio-list">
                        <asp:ListItem Text="Cash on Delivery (COD)" Value="COD" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Online Payment (UPI / Cards / Net Banking)" Value="Online"></asp:ListItem>
                    </asp:RadioButtonList>

                    <div class="payment-note">
                        <i class="fa-solid fa-circle-info"></i> Pay in cash or scan UPI QR with our courier partner BlueDart when your package arrives at your doorstep.
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN: ORDER SUMMARY -->
            <div class="order-summary-box">
                <h3>Order Summary</h3>

                <!-- ITEMS LIST -->
                <div class="summary-items-list">
                    <asp:Repeater ID="rptCheckoutItems" runat="server">
                        <ItemTemplate>
                            <div class="summary-item-row">
                                <div class="summary-item-left">
                                    <img src='<%# Eval("image_url") %>' alt='<%# Eval("product_name") %>' class="summary-thumb" onerror="this.src='images/product_marble_tshirt.jpg'" />
                                    <div class="summary-item-meta">
                                        <h5><%# Eval("product_name") %></h5>
                                        <span>Size: <%# Eval("size") %> &bull; Qty: <%# Eval("quantity") %></span>
                                    </div>
                                </div>
                                <div class="summary-item-price">
                                    &#8377; <%# String.Format("{0:N0}", Convert.ToDecimal(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- COUPON CODE -->
                <div class="coupon-row">
                    <asp:TextBox ID="txtCoupon" runat="server" CssClass="coupon-input" placeholder="Enter coupon code"></asp:TextBox>
                    <asp:Button ID="btnApplyCoupon" runat="server" Text="Apply" CssClass="btn-coupon-apply" OnClick="btnApplyCoupon_Click" CausesValidation="false" />
                </div>
                <asp:Label ID="lblCouponMsg" runat="server" Visible="false" CssClass="coupon-feedback"></asp:Label>

                <!-- PRICE BREAKDOWN -->
                <div class="breakdown-row">
                    <span>Subtotal</span>
                    <span>&#8377; <asp:Label ID="lblSubtotal" runat="server">799</asp:Label></span>
                </div>
                <div class="breakdown-row discount-text">
                    <span>Coupon Discount</span>
                    <span>- &#8377; <asp:Label ID="lblDiscount" runat="server">79</asp:Label></span>
                </div>
                <div class="breakdown-row">
                    <span>Estimated Tax (5% GST)</span>
                    <span>&#8377; <asp:Label ID="lblTax" runat="server">10</asp:Label></span>
                </div>
                <div class="breakdown-row total-bold">
                    <span>Total Payable</span>
                    <span class="final-total-amount">&#8377; <asp:Label ID="lblTotal" runat="server">730</asp:Label></span>
                </div>

                <!-- PLACE ORDER BUTTON -->
                <asp:Button ID="btnPlaceOrder" runat="server" 
                    Text="Place Order — Pay &#8377;730 on Delivery" 
                    CssClass="btn-place-order-large" 
                    OnClick="btnPlaceOrder_Click" 
                    ValidationGroup="CheckoutGroup" />
            </div>
        </div>
    </div>
</asp:Content>
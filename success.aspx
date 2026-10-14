<%@ Page Title="Payment Successful"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="success.aspx.cs"
    Inherits="textiles.success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .success-page-wrapper {
            min-height: 75vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px 70px;
        }

        .success-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 50px 45px;
            max-width: 620px;
            width: 100%;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        .success-check-icon {
            width: 80px;
            height: 80px;
            background: #2e7d32;
            color: #ffffff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            margin: 0 auto 22px;
            box-shadow: 0 6px 20px rgba(46, 125, 50, 0.25);
        }

        .success-card h1 {
            font-size: 28px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .success-card p {
            color: #64748b;
            font-size: 15px;
            margin-bottom: 28px;
        }

        /* ================= ORDER DETAILS BOX ================= */
        .order-summary-box-figma {
            background: #f0f7ff;
            border: 1.5px solid #cce0f7;
            border-radius: 12px;
            padding: 22px 26px;
            text-align: left;
            margin-bottom: 30px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .detail-row:last-child {
            margin-bottom: 0;
        }

        .detail-label {
            color: #64748b;
            font-weight: 500;
        }

        .detail-value {
            color: #1e293b;
            font-weight: 700;
        }

        .detail-value.order-num-highlight {
            color: #1967d2;
            font-family: monospace;
            font-size: 15px;
        }

        /* ================= ACTION BUTTONS ================= */
        .success-actions {
            display: flex;
            gap: 12px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-track-order {
            background: #1967d2;
            color: #ffffff;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-track-order:hover {
            background: #1557b0;
        }

        .btn-download-invoice {
            background: #ffffff;
            color: #1967d2;
            border: 1.5px solid #1967d2;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14.5px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .btn-download-invoice:hover {
            background: #f0f7ff;
        }

        .btn-continue {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .btn-continue:hover {
            background: #e2e8f0;
        }
    </style>

    <div class="success-page-wrapper">
        <!-- FIGMA FIGURE 10: PAYMENT SUCCESSFUL PAGE -->
        <div class="success-card">
            <div class="success-check-icon">
                <i class="fa-solid fa-check"></i>
            </div>

            <h1>Payment Successful!</h1>
            <p>Thank you for your order. Your purchase has been confirmed.</p>

            <div class="order-summary-box-figma">
                <div class="detail-row">
                    <span class="detail-label">Order Number:</span>
                    <span class="detail-value order-num-highlight"><asp:Label ID="lblOrderNumber" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Customer Name:</span>
                    <span class="detail-value"><asp:Label ID="lblCustomerName" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Email:</span>
                    <span class="detail-value"><asp:Label ID="lblCustomerEmail" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Payment Method:</span>
                    <span class="detail-value"><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Total Amount:</span>
                    <span class="detail-value">&#8377; <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Order Status:</span>
                    <span class="detail-value" style="color: #2e7d32;"><asp:Label ID="lblOrderStatus" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Order Date:</span>
                    <span class="detail-value"><asp:Label ID="lblOrderDate" runat="server"></asp:Label></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Estimated Delivery:</span>
                    <span class="detail-value">3 &ndash; 5 Business Days</span>
                </div>
            </div>

            <div class="success-actions">
                <asp:HyperLink ID="lnkTrackOrder" runat="server" CssClass="btn-track-order">
                    <i class="fa-solid fa-truck-fast"></i> Track Order
                </asp:HyperLink>
                <button type="button" class="btn-download-invoice" onclick="window.print();">
                    <i class="fa-solid fa-file-arrow-down"></i> Download Invoice
                </button>
                <a href="product.aspx" class="btn-continue">
                    <i class="fa-solid fa-arrow-left"></i> Continue Shopping
                </a>
            </div>
        </div>
    </div>
</asp:Content>
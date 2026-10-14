<%@ Page Title="Order Tracking"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="tracking.aspx.cs"
    Inherits="textiles.tracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .tracking-page {
            max-width: 1180px;
            margin: 0 auto;
            padding: 35px 20px 70px;
        }

        .tracking-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .tracking-header h1 {
            font-size: 32px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .tracking-header p {
            color: #64748b;
            font-size: 15px;
        }

        /* ================= SEARCH BOX ================= */
        .track-search-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 12px 18px;
            max-width: 580px;
            margin: 0 auto 40px;
            display: flex;
            gap: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.04);
        }

        .track-input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            color: #1e293b;
            font-family: inherit;
        }

        .btn-track-submit {
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-track-submit:hover {
            background: #1557b0;
        }

        /* ================= STEPPER CARD ================= */
        .stepper-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 35px 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            margin-bottom: 35px;
        }

        .stepper-card h2 {
            font-size: 20px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .status-badge-live {
            background: #eaf2fb;
            color: #1967d2;
            font-size: 13px;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: 20px;
        }

        .stepper-track {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin-bottom: 20px;
        }

        .stepper-track::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 20px;
            right: 20px;
            height: 4px;
            background: #e2e8f0;
            z-index: 1;
        }

        .step-node {
            position: relative;
            z-index: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 110px;
        }

        .step-circle {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #ffffff;
            border: 3px solid #cbd5e1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #94a3b8;
            margin-bottom: 10px;
            transition: all 0.3s;
        }

        .step-node.completed .step-circle {
            background: #2e7d32;
            border-color: #2e7d32;
            color: #ffffff;
        }

        .step-node.active .step-circle {
            background: #1967d2;
            border-color: #1967d2;
            color: #ffffff;
            box-shadow: 0 0 0 5px rgba(25, 103, 210, 0.2);
        }

        .step-label {
            font-size: 12.5px;
            font-weight: 700;
            color: #475569;
            margin-bottom: 4px;
        }

        .step-node.active .step-label {
            color: #1967d2;
        }

        .step-node.completed .step-label {
            color: #1e293b;
        }

        .step-time {
            font-size: 11px;
            color: #94a3b8;
        }

        /* ================= DETAILS GRIDS ================= */
        .tracking-details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 35px;
        }

        .info-panel-box {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 26px 28px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
        }

        .info-panel-box h3 {
            font-size: 18px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 18px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .track-info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .track-info-row:last-child {
            margin-bottom: 0;
        }

        .track-info-lbl {
            color: #64748b;
            font-weight: 500;
        }

        .track-info-val {
            color: #1e293b;
            font-weight: 700;
            text-align: right;
            max-width: 60%;
        }

        .track-actions-row {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn-track-action {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-track-blue {
            background: #1967d2;
            color: #ffffff;
            border: none;
        }

        .btn-track-blue:hover {
            background: #1557b0;
        }

        .btn-track-outline {
            background: #ffffff;
            color: #1967d2;
            border: 1.5px solid #1967d2;
        }

        .btn-track-outline:hover {
            background: #f0f7ff;
        }

        @media (max-width: 850px) {
            .stepper-track {
                flex-direction: column;
                gap: 20px;
            }
            .stepper-track::before {
                display: none;
            }
            .step-node {
                flex-direction: row;
                width: 100%;
                text-align: left;
                gap: 15px;
            }
            .tracking-details-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="tracking-page">
        <!-- HEADER (FIGMA FIGURE 11) -->
        <div class="tracking-header">
            <h1><i class="fa-solid fa-truck-fast" style="color: #1967d2;"></i> Order Tracking</h1>
            <p>Track the real-time shipping status and journey of your package</p>
        </div>

        <!-- SEARCH BAR -->
        <div class="track-search-card">
            <asp:TextBox ID="txtTrackOrder" runat="server" CssClass="track-input" placeholder="Enter Order ID (e.g. ORD-FWQ3H)"></asp:TextBox>
            <asp:Button ID="btnTrack" runat="server" Text="Track Order" CssClass="btn-track-submit" OnClick="btnTrack_Click" />
        </div>

        <asp:Label ID="lblTrackingMsg" runat="server" Visible="false" ForeColor="#d32f2f" style="text-align:center; display:block; margin-bottom:20px;"></asp:Label>

        <asp:Panel ID="pnlTrackingResult" runat="server">
            <!-- STEPPER CARD (FIGMA FIGURE 11) -->
            <div class="stepper-card">
                <h2>
                    <span>Shipment Progress</span>
                    <span class="status-badge-live"><i class="fa-solid fa-circle-dot"></i> <%= OrderStatus %></span>
                </h2>

                <div class="stepper-track">
                    <div class="step-node <%= StepIndex >= 1 ? "completed" : "" %>">
                        <div class="step-circle"><i class="fa-solid fa-check"></i></div>
                        <span class="step-label">Order Placed</span>
                        <span class="step-time">01 Mar, 10:30 AM</span>
                    </div>

                    <div class="step-node <%= StepIndex >= 2 ? "completed" : "" %>">
                        <div class="step-circle"><i class="fa-solid fa-check"></i></div>
                        <span class="step-label">Payment Confirmed</span>
                        <span class="step-time">01 Mar, 10:35 AM</span>
                    </div>

                    <div class="step-node <%= StepIndex >= 3 ? "completed" : "" %>">
                        <div class="step-circle"><i class="fa-solid fa-check"></i></div>
                        <span class="step-label">Processing</span>
                        <span class="step-time">01 Mar, 02:15 PM</span>
                    </div>

                    <div class="step-node <%= StepIndex >= 4 ? "completed" : "" %>">
                        <div class="step-circle"><i class="fa-solid fa-check"></i></div>
                        <span class="step-label">Packed</span>
                        <span class="step-time">02 Mar, 09:40 AM</span>
                    </div>

                    <div class="step-node <%= StepIndex == 5 ? "active" : (StepIndex > 5 ? "completed" : "") %>">
                        <div class="step-circle"><i class="fa-solid fa-truck"></i></div>
                        <span class="step-label">Shipped</span>
                        <span class="step-time">In Transit</span>
                    </div>

                    <div class="step-node <%= StepIndex == 6 ? "active" : (StepIndex > 6 ? "completed" : "") %>">
                        <div class="step-circle"><i class="fa-solid fa-motorcycle"></i></div>
                        <span class="step-label">Out for Delivery</span>
                        <span class="step-time">Expected 04 Mar</span>
                    </div>

                    <div class="step-node <%= StepIndex >= 7 ? "completed" : "" %>">
                        <div class="step-circle"><i class="fa-solid fa-house-chimney"></i></div>
                        <span class="step-label">Delivered</span>
                        <span class="step-time">Pending</span>
                    </div>
                </div>
            </div>

            <!-- TWO DETAILS CARDS -->
            <div class="tracking-details-grid">
                <!-- ORDER DETAILS CARD -->
                <div class="info-panel-box">
                    <h3><i class="fa-solid fa-receipt" style="color: #1967d2;"></i> Order Details</h3>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Order ID:</span>
                        <span class="track-info-val"><asp:Label ID="lblOrderId" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Order Date:</span>
                        <span class="track-info-val"><asp:Label ID="lblOrderDate" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Total Amount:</span>
                        <span class="track-info-val">&#8377; <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Payment Method:</span>
                        <span class="track-info-val"><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Items:</span>
                        <span class="track-info-val"><asp:Label ID="lblItemsList" runat="server"></asp:Label></span>
                    </div>
                </div>

                <!-- SHIPPING INFO CARD -->
                <div class="info-panel-box">
                    <h3><i class="fa-solid fa-location-crosshairs" style="color: #1967d2;"></i> Shipping Information</h3>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Recipient Name:</span>
                        <span class="track-info-val"><asp:Label ID="lblCustomerName" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Delivery Address:</span>
                        <span class="track-info-val"><asp:Label ID="lblAddress" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Contact Phone:</span>
                        <span class="track-info-val"><asp:Label ID="lblPhone" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Courier Partner:</span>
                        <span class="track-info-val"><asp:Label ID="lblCourier" runat="server"></asp:Label></span>
                    </div>
                    <div class="track-info-row">
                        <span class="track-info-lbl">Tracking AWB:</span>
                        <span class="track-info-val" style="font-family: monospace; color:#1967d2;"><asp:Label ID="lblAwb" runat="server"></asp:Label></span>
                    </div>
                </div>
            </div>

            <!-- BUTTONS -->
            <div class="track-actions-row">
                <a href="product.aspx" class="btn-track-action btn-track-blue">
                    <i class="fa-solid fa-shirt"></i> Continue Shopping
                </a>
                <button type="button" class="btn-track-action btn-track-outline" onclick="window.print();">
                    <i class="fa-solid fa-file-arrow-down"></i> Download Invoice
                </button>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

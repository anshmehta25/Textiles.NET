<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="textiles.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

    <style>
        /* ================= PROFILE PAGE ================= */
        .profile-page {
            background: #f5f6f8;
            min-height: 700px;
            padding: 40px 0 60px;
        }

        .profile-container {
            width: 88%;
            max-width: 1250px;
            margin: auto;
        }

        /* ================= PAGE HEADER ================= */
        .profile-header {
            margin-bottom: 25px;
        }

        .profile-header h1 {
            font-size: 30px;
            color: #17323f;
            margin-bottom: 6px;
            font-weight: 700;
        }

        .profile-header p {
            color: #667085;
            margin: 0;
            font-size: 15px;
        }

        /* ================= ALERTS ================= */
        .alert-banner {
            padding: 14px 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .alert-success {
            background: #d1e7dd;
            color: #0f5132;
            border: 1px solid #badbcc;
        }

        .alert-danger {
            background: #f8d7da;
            color: #842029;
            border: 1px solid #f5c2c7;
        }

        /* ================= PROFILE GRID ================= */
        .profile-layout {
            display: grid;
            grid-template-columns: 290px 1fr;
            gap: 28px;
            align-items: start;
        }

        /* ================= SIDEBAR ================= */
        .profile-sidebar {
            background: #ffffff;
            border-radius: 14px;
            padding: 30px 22px;
            text-align: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.06);
            border: 1px solid #e9ecef;
        }

        .profile-image-box {
            position: relative;
            width: 120px;
            height: 120px;
            margin: 0 auto 16px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #28609d;
            background: #f1f5f9;
        }

        .upload-btn {
            position: absolute;
            bottom: 2px;
            right: 2px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #28609d;
            color: #ffffff;
            border: 3px solid #ffffff;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            transition: 0.2s;
        }

        .upload-btn:hover {
            background: #1d4b7c;
            transform: scale(1.05);
        }

        .profile-name {
            font-size: 20px;
            font-weight: 700;
            color: #17323f;
            margin-bottom: 5px;
        }

        .profile-email {
            color: #64748b;
            font-size: 13.5px;
            word-break: break-all;
            margin-bottom: 22px;
        }

        /* ================= MENU TABS ================= */
        .profile-menu {
            text-align: left;
            border-top: 1px solid #edf2f7;
            padding-top: 15px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .profile-menu button,
        .profile-menu .menu-link {
            width: 100%;
            border: none;
            background: transparent;
            padding: 12px 14px;
            text-align: left;
            cursor: pointer;
            border-radius: 8px;
            color: #475569;
            font-size: 14.5px;
            font-weight: 500;
            transition: all 0.25s ease;
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            box-sizing: border-box;
        }

        .profile-menu button i,
        .profile-menu .menu-link i {
            width: 20px;
            text-align: center;
            color: #64748b;
            font-size: 16px;
        }

        .profile-menu button:hover,
        .profile-menu button.active {
            background: #eef4fa;
            color: #28609d;
            font-weight: 600;
        }

        .profile-menu button:hover i,
        .profile-menu button.active i {
            color: #28609d;
        }

        .logout-link {
            color: #dc3545 !important;
            margin-top: 10px;
            border-top: 1px solid #edf2f7 !important;
            padding-top: 14px !important;
            border-radius: 0 !important;
        }

        .logout-link i {
            color: #dc3545 !important;
        }

        .logout-link:hover {
            background: #fff5f5 !important;
        }

        /* ================= CONTENT CONTAINER ================= */
        .profile-content {
            min-width: 0;
        }

        .profile-section {
            display: none;
            background: #ffffff;
            border-radius: 14px;
            padding: 32px 30px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.06);
            border: 1px solid #e9ecef;
            animation: fadeIn 0.3s ease;
        }

        .profile-section.active-section {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(8px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .section-title {
            font-size: 22px;
            font-weight: 700;
            color: #17323f;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title i {
            color: #28609d;
        }

        .section-description {
            color: #64748b;
            margin-bottom: 25px;
            font-size: 14px;
        }

        /* ================= STATS GRID ================= */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 30px;
        }

        .stat-card {
            padding: 20px 18px;
            border-radius: 10px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            text-align: left;
            transition: 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
        }

        .stat-icon {
            font-size: 22px;
            color: #28609d;
            margin-bottom: 8px;
        }

        .stat-number {
            font-size: 26px;
            font-weight: 700;
            color: #17323f;
            margin-bottom: 4px;
        }

        .stat-label {
            color: #64748b;
            font-size: 13px;
            font-weight: 500;
        }

        /* ================= TABLES ================= */
        .table-responsive {
            overflow-x: auto;
            margin-top: 15px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .orders-table th {
            background: #f8fafc;
            padding: 13px 16px;
            color: #475569;
            font-size: 13.5px;
            font-weight: 600;
            border-bottom: 1px solid #e2e8f0;
        }

        .orders-table td {
            padding: 14px 16px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            font-size: 14px;
            vertical-align: middle;
        }

        .orders-table tr:last-child td {
            border-bottom: none;
        }

        .status {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-delivered {
            background: #dcfce7;
            color: #15803d;
        }

        .status-processing {
            background: #fef9c3;
            color: #a16207;
        }

        .status-pending {
            background: #f1f5f9;
            color: #475569;
        }

        .status-cancelled {
            background: #fee2e2;
            color: #b91c1c;
        }

        /* ================= FORMS ================= */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            margin-bottom: 7px;
            font-weight: 600;
            color: #334155;
            font-size: 13.5px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            outline: none;
            font-size: 14.5px;
            font-family: inherit;
            color: #1e293b;
            box-sizing: border-box;
            background: #ffffff;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-control:focus {
            border-color: #28609d;
            box-shadow: 0 0 0 3px rgba(40,96,157,0.12);
        }

        .form-control[readonly] {
            background: #f8fafc;
            color: #64748b;
            cursor: not-allowed;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 90px;
        }

        .val-msg {
            color: #dc3545;
            font-size: 12.5px;
            font-weight: 500;
            margin-top: 5px;
            display: block;
        }

        /* ================= ADDRESS CARD ================= */
        .address-card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-left: 4px solid #28609d;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 28px;
        }

        .address-card h3 {
            font-size: 16px;
            color: #17323f;
            margin-bottom: 8px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .address-card p {
            color: #475569;
            margin: 0;
            line-height: 1.6;
            font-size: 14.5px;
        }

        /* ================= BUTTONS ================= */
        .save-btn {
            margin-top: 22px;
            padding: 13px 26px;
            background: #28609d;
            color: #ffffff;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14.5px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
        }

        .save-btn:hover {
            background: #1d4b7c;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(40,96,157,0.25);
        }

        .empty-state {
            text-align: center;
            padding: 45px 20px;
            color: #64748b;
        }

        .empty-state i {
            font-size: 40px;
            color: #cbd5e1;
            margin-bottom: 12px;
            display: block;
        }

        .empty-state p {
            margin: 0 0 15px;
            font-size: 15px;
        }

        .empty-btn {
            display: inline-block;
            background: #28609d;
            color: #ffffff;
            padding: 9px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13.5px;
            font-weight: 600;
        }

        /* ================= RESPONSIVE ================= */
        @media screen and (max-width: 950px) {
            .profile-layout {
                grid-template-columns: 1fr;
            }
            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media screen and (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            .stats-grid {
                grid-template-columns: 1fr;
            }
            .profile-container {
                width: 93%;
            }
            .profile-section {
                padding: 22px 18px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="profile-page">
        <div class="profile-container">

            <!-- PAGE HEADER -->
            <div class="profile-header">
                <h1>My Account Panel</h1>
                <p>Manage your profile details, tracked orders, shipping addresses and security.</p>
            </div>

            <!-- ALERT BANNER -->
            <asp:Panel ID="pnlAlert" runat="server" Visible="false">
                <i class="fa-solid fa-circle-info"></i>
                <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
            </asp:Panel>

            <asp:HiddenField ID="hfActiveTab" runat="server" Value="dashboard" />

            <div class="profile-layout">

                <!-- ================= LEFT SIDEBAR ================= -->
                <aside class="profile-sidebar">
                    <div class="profile-image-box">
                        <img id="profileImage" class="profile-image"
                             src="https://ui-avatars.com/api/?name=User&background=28609d&color=fff&size=200"
                             alt="Profile Image" />
                        <button type="button" class="upload-btn" title="Change Photo"
                                onclick="document.getElementById('imageUpload').click()">
                            <i class="fa-solid fa-camera"></i>
                        </button>
                        <input type="file" id="imageUpload" accept="image/*" style="display:none;" onchange="changeProfileImage(event)" />
                    </div>

                    <div class="profile-name">
                        <asp:Label ID="lblProfileName" runat="server">User Name</asp:Label>
                    </div>
                    <div class="profile-email">
                        <asp:Label ID="lblProfileEmail" runat="server">user@email.com</asp:Label>
                    </div>

                    <!-- PROFILE TABS MENU -->
                    <div class="profile-menu">
                        <button type="button" class="menu-btn active" id="tab-dashboard" onclick="switchTab('dashboard', this)">
                            <i class="fa-solid fa-chart-line"></i> Dashboard
                        </button>

                        <button type="button" class="menu-btn" id="tab-profile" onclick="switchTab('profile', this)">
                            <i class="fa-solid fa-user"></i> My Profile
                        </button>

                        <button type="button" class="menu-btn" id="tab-orders" onclick="switchTab('orders', this)">
                            <i class="fa-solid fa-box-open"></i> My Orders
                        </button>

                        <button type="button" class="menu-btn" id="tab-address" onclick="switchTab('address', this)">
                            <i class="fa-solid fa-location-dot"></i> Delivery Address
                        </button>

                        <button type="button" class="menu-btn" id="tab-password" onclick="switchTab('password', this)">
                            <i class="fa-solid fa-key"></i> Change Password
                        </button>

                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="menu-link logout-link" OnClick="btnLogout_Click" CausesValidation="false">
                            <i class="fa-solid fa-right-from-bracket"></i> Sign Out
                        </asp:LinkButton>
                    </div>
                </aside>

                <!-- ================= CONTENT SECTIONS ================= -->
                <main class="profile-content">

                    <!-- 1. DASHBOARD TAB -->
                    <div id="section-dashboard" class="profile-section active-section">
                        <h2 class="section-title">
                            <i class="fa-solid fa-chart-line"></i> Account Dashboard
                        </h2>
                        <p class="section-description">
                            Welcome back! Overview of your shopping activity and recent orders.
                        </p>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-icon"><i class="fa-solid fa-bag-shopping"></i></div>
                                <div class="stat-number"><asp:Label ID="lblTotalOrders" runat="server">0</asp:Label></div>
                                <div class="stat-label">Total Orders</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-icon"><i class="fa-solid fa-circle-check"></i></div>
                                <div class="stat-number"><asp:Label ID="lblDeliveredOrders" runat="server">0</asp:Label></div>
                                <div class="stat-label">Delivered</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-icon"><i class="fa-solid fa-clock-rotate-left"></i></div>
                                <div class="stat-number"><asp:Label ID="lblProcessingOrders" runat="server">0</asp:Label></div>
                                <div class="stat-label">Processing</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-icon"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                                <div class="stat-number"><asp:Label ID="lblTotalSpent" runat="server">&#8377;0</asp:Label></div>
                                <div class="stat-label">Total Spent</div>
                            </div>
                        </div>

                        <h3 class="section-title" style="font-size:18px; margin-top:20px;">
                            <i class="fa-solid fa-clock"></i> Recent Orders
                        </h3>

                        <div class="table-responsive">
                            <table class="orders-table">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Date</th>
                                        <th>Recipient</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptRecentOrders" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><strong><%# Eval("order_number") %></strong></td>
                                                <td><%# Convert.ToDateTime(Eval("created_at")).ToString("dd MMM yyyy") %></td>
                                                <td><%# Eval("customer_name") %></td>
                                                <td><strong>&#8377;<%# String.Format("{0:N0}", Eval("total_amount")) %></strong></td>
                                                <td>
                                                    <span class='<%# "status status-" + Eval("order_status").ToString().ToLower() %>'>
                                                        <%# Eval("order_status") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <asp:Panel ID="pnlNoRecentOrders" runat="server" CssClass="empty-state" Visible="false">
                                <i class="fa-solid fa-box-open"></i>
                                <p>No orders placed yet.</p>
                                <a href="product.aspx" class="empty-btn"><i class="fa-solid fa-bag-shopping"></i> Browse Men's Collection</a>
                            </asp:Panel>
                        </div>
                    </div>


                    <!-- 2. MY PROFILE TAB -->
                    <div id="section-profile" class="profile-section">
                        <h2 class="section-title">
                            <i class="fa-solid fa-user-pen"></i> Personal Information
                        </h2>
                        <p class="section-description">
                            Update your personal profile details. All inputs use ASP.NET server validation.
                        </p>

                        <div class="form-grid">
                            <div class="form-group">
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                    ControlToValidate="txtFirstName"
                                    ErrorMessage="First name is required."
                                    ValidationGroup="ProfileGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                    ControlToValidate="txtLastName"
                                    ErrorMessage="Last name is required."
                                    ValidationGroup="ProfileGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>Email Address (Account ID)</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Phone Number (10 Digits)</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="e.g. 9876543210"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProfilePhone" runat="server"
                                    ControlToValidate="txtPhone"
                                    ErrorMessage="Phone number is required."
                                    ValidationGroup="ProfileGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                                <asp:RegularExpressionValidator ID="revProfilePhone" runat="server"
                                    ControlToValidate="txtPhone"
                                    ValidationExpression="^[0-9]{10}$"
                                    ErrorMessage="Phone number must be exactly 10 digits."
                                    ValidationGroup="ProfileGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>Gender</label>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group full-width">
                                <label>About Me (Bio)</label>
                                <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Share a few words about your fashion style..."></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnSaveProfile" runat="server"
                            Text="Save Profile Changes"
                            CssClass="save-btn"
                            ValidationGroup="ProfileGroup"
                            CausesValidation="true"
                            OnClick="btnSaveProfile_Click" />
                    </div>


                    <!-- 3. MY ORDERS TAB -->
                    <div id="section-orders" class="profile-section">
                        <h2 class="section-title">
                            <i class="fa-solid fa-box-open"></i> Order History
                        </h2>
                        <p class="section-description">
                            Review and track all your previous purchases with current fulfillment status.
                        </p>

                        <div class="table-responsive">
                            <table class="orders-table">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Recipient</th>
                                        <th>Payment</th>
                                        <th>Total Amount</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptAllOrders" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><strong><%# Eval("order_number") %></strong></td>
                                                <td><%# Convert.ToDateTime(Eval("created_at")).ToString("dd MMM yyyy, hh:mm tt") %></td>
                                                <td><%# Eval("customer_name") %></td>
                                                <td><%# Eval("payment_method") %></td>
                                                <td><strong>&#8377;<%# String.Format("{0:N0}", Eval("total_amount")) %></strong></td>
                                                <td>
                                                    <span class='<%# "status status-" + Eval("order_status").ToString().ToLower() %>'>
                                                        <%# Eval("order_status") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <asp:Panel ID="pnlNoAllOrders" runat="server" CssClass="empty-state" Visible="false">
                                <i class="fa-solid fa-bag-shopping"></i>
                                <p>You have not placed any orders yet.</p>
                                <a href="product.aspx" class="empty-btn"><i class="fa-solid fa-cart-plus"></i> Shop Men's Fashion</a>
                            </asp:Panel>
                        </div>
                    </div>


                    <!-- 4. ADDRESS TAB -->
                    <div id="section-address" class="profile-section">
                        <h2 class="section-title">
                            <i class="fa-solid fa-location-dot"></i> Delivery Address
                        </h2>
                        <p class="section-description">
                            Manage your saved shipping address used for fast checkouts.
                        </p>

                        <div class="address-card">
                            <h3><i class="fa-solid fa-house"></i> Default Shipping Address</h3>
                            <p>
                                <asp:Label ID="lblDisplayAddress" runat="server">No address saved yet.</asp:Label>
                            </p>
                        </div>

                        <div class="form-grid">
                            <div class="form-group full-width">
                                <label>Street Address / House / Flat</label>
                                <asp:TextBox ID="txtAddressLine" runat="server" CssClass="form-control" placeholder="House/Flat No., Building Name, Street/Area"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddressLine" runat="server"
                                    ControlToValidate="txtAddressLine"
                                    ErrorMessage="Street address is required."
                                    ValidationGroup="AddressGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                    ControlToValidate="txtCity"
                                    ErrorMessage="City is required."
                                    ValidationGroup="AddressGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>State</label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server"
                                    ControlToValidate="txtState"
                                    ErrorMessage="State is required."
                                    ValidationGroup="AddressGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>PIN Code (6 Digits)</label>
                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="6-digit PIN code"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPincode" runat="server"
                                    ControlToValidate="txtPincode"
                                    ErrorMessage="PIN code is required."
                                    ValidationGroup="AddressGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                                <asp:RegularExpressionValidator ID="revPincode" runat="server"
                                    ControlToValidate="txtPincode"
                                    ValidationExpression="^[0-9]{6}$"
                                    ErrorMessage="PIN code must be exactly 6 digits."
                                    ValidationGroup="AddressGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group">
                                <label>Country</label>
                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" Text="India"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnSaveAddress" runat="server"
                            Text="Save Delivery Address"
                            CssClass="save-btn"
                            ValidationGroup="AddressGroup"
                            CausesValidation="true"
                            OnClick="btnSaveAddress_Click" />
                    </div>


                    <!-- 5. CHANGE PASSWORD TAB -->
                    <div id="section-password" class="profile-section">
                        <h2 class="section-title">
                            <i class="fa-solid fa-key"></i> Change Password
                        </h2>
                        <p class="section-description">
                            Keep your account secure with a strong password.
                        </p>

                        <div style="max-width: 500px;">
                            <div class="form-group" style="margin-bottom: 16px;">
                                <label>Current Password</label>
                                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter current password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server"
                                    ControlToValidate="txtCurrentPassword"
                                    ErrorMessage="Current password is required."
                                    ValidationGroup="PasswordGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group" style="margin-bottom: 16px;">
                                <label>New Password (Min 6 Characters)</label>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
                                    ControlToValidate="txtNewPassword"
                                    ErrorMessage="New password is required."
                                    ValidationGroup="PasswordGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                                <asp:RegularExpressionValidator ID="revNewPassword" runat="server"
                                    ControlToValidate="txtNewPassword"
                                    ValidationExpression="^.{6,}$"
                                    ErrorMessage="New password must be at least 6 characters long."
                                    ValidationGroup="PasswordGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <div class="form-group" style="margin-bottom: 16px;">
                                <label>Confirm New Password</label>
                                <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmNewPassword" runat="server"
                                    ControlToValidate="txtConfirmNewPassword"
                                    ErrorMessage="Please confirm your new password."
                                    ValidationGroup="PasswordGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                                <asp:CompareValidator ID="cvConfirmNewPassword" runat="server"
                                    ControlToValidate="txtConfirmNewPassword"
                                    ControlToCompare="txtNewPassword"
                                    ErrorMessage="New password and Confirm password do not match."
                                    ValidationGroup="PasswordGroup"
                                    ForeColor="#dc3545" Display="Dynamic" CssClass="val-msg" />
                            </div>

                            <asp:Button ID="btnChangePassword" runat="server"
                                Text="Update Password"
                                CssClass="save-btn"
                                ValidationGroup="PasswordGroup"
                                CausesValidation="true"
                                OnClick="btnChangePassword_Click" />
                        </div>
                    </div>

                </main>
            </div>
        </div>
    </section>

    <script>
        function switchTab(tabName, btn) {
            document.querySelectorAll(".profile-section").forEach(function(sec) {
                sec.classList.remove("active-section");
            });

            var targetSec = document.getElementById("section-" + tabName);
            if (targetSec) {
                targetSec.classList.add("active-section");
            }

            document.querySelectorAll(".profile-menu button").forEach(function(b) {
                b.classList.remove("active");
            });

            if (btn) {
                btn.classList.add("active");
            } else {
                var autoBtn = document.getElementById("tab-" + tabName);
                if (autoBtn) autoBtn.classList.add("active");
            }

            var hf = document.getElementById("<%= hfActiveTab.ClientID %>");
            if (hf) {
                hf.value = tabName;
            }
        }

        function changeProfileImage(event) {
            var file = event.target.files[0];
            if (!file) return;

            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.getElementById("profileImage");
                if (img) img.src = e.target.result;
                try {
                    localStorage.setItem("user_profile_img", e.target.result);
                } catch(err) {}
            };
            reader.readAsDataURL(file);
        }

        document.addEventListener("DOMContentLoaded", function() {
            var hf = document.getElementById("<%= hfActiveTab.ClientID %>");
            var currentTab = (hf && hf.value) ? hf.value : "dashboard";
            switchTab(currentTab);

            var savedImg = localStorage.getItem("user_profile_img");
            if (savedImg) {
                var img = document.getElementById("profileImage");
                if (img) img.src = savedImg;
            }
        });
    </script>
</asp:Content>
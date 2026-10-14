<%@ Page Title="Admin Panel"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="admin.aspx.cs"
    Inherits="textiles.admin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel - Online Clothing Store</title>

    <!-- Google Fonts & Font Awesome 6 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

    <style>
        :root {
            --primary-blue: #1565c0;
            --primary-blue-dark: #0d47a1;
            --primary-blue-light: #1976d2;
            --active-nav-bg: rgba(255, 255, 255, 0.18);
            --bg-gray: #f4f6f9;
            --card-bg: #ffffff;
            --text-dark: #212529;
            --text-muted: #6c757d;
            --border-color: #e9ecef;
            --border-light: #dee2e6;
            --border-radius: 6px;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', 'Roboto', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg-gray);
            color: var(--text-dark);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
        }

        /* Full layout */
        .admin-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */
        .admin-sidebar {
            width: 220px;
            background-color: var(--primary-blue);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 24px 20px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.12);
        }

        .sidebar-logo-box {
            width: 52px;
            height: 52px;
            background: #ffffff;
            border-radius: 8px;
            margin: 0 auto 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1e293b;
            font-size: 24px;
            font-weight: 800;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .sidebar-header-title {
            font-size: 13px;
            font-weight: 500;
            color: #ffffff;
            opacity: 0.95;
            letter-spacing: 0.3px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 14px 0;
            flex: 1;
        }

        .sidebar-menu li {
            margin-bottom: 2px;
        }

        .sidebar-menu a {
            display: block;
            padding: 12px 24px;
            color: #ffffff;
            text-decoration: none;
            font-size: 14.5px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.15s ease, opacity 0.15s ease;
            opacity: 0.9;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            opacity: 1;
        }

        .sidebar-menu a.active {
            background-color: var(--active-nav-bg);
            font-weight: 600;
            opacity: 1;
        }

        .sidebar-footer {
            padding: 16px 24px;
            border-top: 1px solid rgba(255, 255, 255, 0.12);
        }

        .sidebar-footer a {
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            opacity: 0.85;
            display: block;
            transition: opacity 0.15s ease;
        }

        .sidebar-footer a:hover {
            opacity: 1;
        }

        /* ================= MAIN CONTAINER ================= */
        .admin-main {
            margin-left: 220px;
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Blue Topbar */
        .admin-topbar {
            height: 60px;
            background-color: var(--primary-blue);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
            position: sticky;
            top: 0;
            z-index: 999;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        .admin-topbar h1 {
            font-size: 18px;
            font-weight: 600;
            color: #ffffff;
            letter-spacing: 0.2px;
        }

        /* Content Area */
        .admin-content {
            padding: 24px 32px 60px;
            flex: 1;
        }

        .admin-view {
            display: none;
        }

        .admin-view.active {
            display: block;
        }

        /* ================= STAT CARDS WITH TOP ACCENTS ================= */
        .stat-cards-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 24px;
        }

        .stat-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 22px 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.04);
            border: 1px solid #edf2f7;
            border-top: 4px solid var(--card-accent, #1976d2);
        }

        .stat-card.blue { --card-accent: #1976d2; }
        .stat-card.green { --card-accent: #2e7d32; }
        .stat-card.orange { --card-accent: #e65100; }
        .stat-card.purple { --card-accent: #7b1fa2; }
        .stat-card.teal { --card-accent: #00897b; }
        .stat-card.red { --card-accent: #d32f2f; }

        .stat-card .stat-number {
            font-size: 30px;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 8px;
        }

        .stat-card.blue .stat-number { color: #1976d2; }
        .stat-card.green .stat-number { color: #2e7d32; }
        .stat-card.orange .stat-number { color: #e65100; }
        .stat-card.purple .stat-number { color: #7b1fa2; }
        .stat-card.teal .stat-number { color: #00897b; }
        .stat-card.red .stat-number { color: #d32f2f; }

        .stat-card .stat-title {
            font-size: 13.5px;
            font-weight: 500;
            color: var(--text-muted);
        }

        .stat-card .stat-subtitle {
            font-size: 11.5px;
            color: #94a3b8;
            margin-top: 4px;
        }

        /* ================= DASHBOARD TWO COLUMN ================= */
        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .white-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 22px 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.04);
            border: 1px solid #edf2f7;
        }

        .card-heading {
            font-size: 16px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 18px;
        }

        /* Recent Orders List Items */
        .recent-order-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .recent-order-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .recent-order-left .order-id {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 2px;
        }

        .recent-order-left .cust-name {
            font-size: 12.5px;
            color: var(--text-muted);
        }

        .recent-order-right {
            text-align: right;
        }

        .recent-order-right .order-price {
            font-size: 14px;
            font-weight: 700;
            color: #1565c0;
            margin-bottom: 2px;
        }

        .order-status-text {
            font-size: 12px;
            font-weight: 600;
        }

        .order-status-text.delivered { color: #2e7d32; }
        .order-status-text.shipped { color: #1565c0; }
        .order-status-text.processing { color: #e65100; }
        .order-status-text.pending { color: #0284c7; }

        /* Products Overview List */
        .product-overview-item {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 10px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .product-overview-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .product-overview-thumb {
            width: 44px;
            height: 44px;
            border-radius: 4px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
        }

        .product-overview-details {
            flex: 1;
        }

        .product-overview-title {
            font-size: 13.5px;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 2px;
        }

        .product-overview-price {
            font-size: 13px;
            font-weight: 600;
            color: #1565c0;
        }

        .product-overview-stock {
            font-size: 12.5px;
            color: #64748b;
            font-weight: 500;
        }

        /* ================= BLUE HEADER DATA TABLES ================= */
        .table-action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .table-counter-text {
            font-size: 14px;
            color: var(--text-muted);
            font-weight: 500;
        }

        .btn-add-primary {
            background-color: var(--primary-blue);
            color: #ffffff;
            border: none;
            padding: 9px 20px;
            border-radius: 4px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.15s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
        }

        .btn-add-primary:hover {
            background-color: var(--primary-blue-dark);
            color: #ffffff;
        }

        .blue-header-table-wrapper {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.04);
            border: 1px solid #edf2f7;
        }

        .blue-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13.5px;
            text-align: left;
        }

        .blue-table th {
            background-color: var(--primary-blue);
            color: #ffffff;
            font-weight: 600;
            font-size: 13.5px;
            padding: 13px 18px;
            border: none;
            letter-spacing: 0.2px;
        }

        .blue-table td {
            padding: 12px 18px;
            border-bottom: 1px solid #edf2f7;
            color: var(--text-dark);
            vertical-align: middle;
            background: #ffffff;
        }

        .blue-table tr:last-child td {
            border-bottom: none;
        }

        .blue-table tr:hover td {
            background-color: #fafbfc;
        }

        .table-product-thumb {
            width: 44px;
            height: 44px;
            border-radius: 4px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
            display: block;
        }

        .table-price-bold {
            color: #1565c0;
            font-weight: 700;
        }

        /* Action Buttons */
        .btn-action-edit {
            border: 1px solid #1976d2;
            color: #1976d2;
            background: #ffffff;
            padding: 5px 16px;
            border-radius: 4px;
            font-size: 12.5px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.15s ease;
        }

        .btn-action-edit:hover {
            background: #e3f2fd;
        }

        .btn-action-delete {
            border: 1px solid #fca5a5;
            color: #ef4444;
            background: #ffffff;
            padding: 5px 16px;
            border-radius: 4px;
            font-size: 12.5px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.15s ease;
        }

        .btn-action-delete:hover {
            background: #fee2e2;
        }

        .btn-action-view {
            background-color: var(--primary-blue);
            color: #ffffff;
            border: none;
            padding: 6px 18px;
            border-radius: 4px;
            font-size: 12.5px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.15s ease;
        }

        .btn-action-view:hover {
            background-color: var(--primary-blue-dark);
            color: #ffffff;
        }

        /* Soft Pill Status Badges */
        .status-pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-pill.delivered { background: #e8f5e9; color: #2e7d32; }
        .status-pill.shipped { background: #e3f2fd; color: #1565c0; }
        .status-pill.processing { background: #fff3e0; color: #e65100; }
        .status-pill.pending { background: #f1f5f9; color: #475569; }

        /* ================= MODAL & FORM VALIDATION ================= */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 23, 42, 0.5);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 2000;
            backdrop-filter: blur(2px);
        }

        .modal-overlay.open {
            display: flex;
        }

        .modal-box {
            background: #ffffff;
            border-radius: 8px;
            width: 100%;
            max-width: 620px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            animation: modalFadeIn 0.2s ease-out;
        }

        @keyframes modalFadeIn {
            from { transform: translateY(-15px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .modal-header {
            background: var(--primary-blue);
            color: #ffffff;
            padding: 16px 22px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            font-size: 16px;
            font-weight: 600;
        }

        .modal-close-btn {
            background: transparent;
            border: none;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            opacity: 0.85;
            transition: opacity 0.15s;
        }

        .modal-close-btn:hover {
            opacity: 1;
        }

        .modal-body {
            padding: 24px;
            max-height: 80vh;
            overflow-y: auto;
        }

        .form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 14px;
        }

        .form-group-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
            margin-bottom: 14px;
        }

        .form-group-item label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        .form-input-ctrl {
            border: 1px solid #cbd5e1;
            background: #ffffff;
            border-radius: 4px;
            padding: 9px 12px;
            font-size: 13.5px;
            color: #1e293b;
            font-family: inherit;
            outline: none;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }

        .form-input-ctrl:focus {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 3px rgba(21, 101, 192, 0.15);
        }

        .form-input-ctrl.input-error {
            border-color: #dc2626 !important;
            background-color: #fef2f2 !important;
        }

        .field-validation-error {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
            display: none;
            margin-top: 2px;
        }

        .field-validation-error.show {
            display: block;
        }

        .modal-footer {
            padding: 16px 24px;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-modal-cancel {
            background: #ffffff;
            border: 1px solid #cbd5e1;
            color: #475569;
            padding: 8px 18px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-modal-cancel:hover {
            background: #f1f5f9;
        }

        .alert-toast {
            padding: 10px 16px;
            border-radius: 4px;
            margin-bottom: 16px;
            font-size: 13px;
            font-weight: 500;
        }

        .alert-toast.success {
            background: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .admin-sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .admin-main {
                margin-left: 0;
            }
            .stat-cards-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">

            <!-- ================= LEFT BLUE SIDEBAR ================= -->
            <aside class="admin-sidebar">
                <div class="sidebar-header">
                    <div class="sidebar-logo-box">
                        <i class="fa-solid fa-shapes"></i>
                    </div>
                    <div class="sidebar-header-title">Welcome to Admin Panel</div>
                </div>

                <ul class="sidebar-menu">
                    <li>
                        <a href="javascript:void(0)" class="active" onclick="switchNav('dashboard', this)">Dashboard</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="switchNav('products', this)">Products</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="switchNav('orders', this)">Orders</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="switchNav('users', this)">Users</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="switchNav('reports', this)">Reports</a>
                    </li>
                </ul>

                <div class="sidebar-footer">
                    <a href="login.aspx">Logout</a>
                </div>
            </aside>

            <!-- ================= MAIN CONTENT ================= -->
            <main class="admin-main">
                
                <!-- TOP BLUE BAR -->
                <header class="admin-topbar">
                    <h1 id="topbarTitle">Dashboard</h1>
                    <div>
                        <a href="index.aspx" target="_blank" style="color:#ffffff; text-decoration:none; font-size:13.5px; opacity:0.9;">
                            <i class="fa-solid fa-store" style="margin-right:4px;"></i> View Store
                        </a>
                    </div>
                </header>

                <div class="admin-content">

                    <!-- Message toast if product added/deleted -->
                    <asp:Label ID="lblAdminProductMsg" runat="server" Visible="false" CssClass="alert-toast success" />

                    <!-- ================= VIEW 1: DASHBOARD ================= -->
                    <section id="dashboardView" class="admin-view active">
                        
                        <!-- 4 Stat Cards with Top Colored Borders -->
                        <div class="stat-cards-grid">
                            <div class="stat-card blue">
                                <div class="stat-number">
                                    <asp:Label ID="lblTotalProducts" runat="server" Text="5" />
                                </div>
                                <div class="stat-title">Total Products</div>
                            </div>

                            <div class="stat-card green">
                                <div class="stat-number">
                                    <asp:Label ID="lblTotalOrders" runat="server" Text="5" />
                                </div>
                                <div class="stat-title">Total Orders</div>
                            </div>

                            <div class="stat-card orange">
                                <div class="stat-number">
                                    <asp:Label ID="lblTotalCustomers" runat="server" Text="5" />
                                </div>
                                <div class="stat-title">Total Users</div>
                            </div>

                            <div class="stat-card purple">
                                <div class="stat-number">
                                    &#8377;<asp:Label ID="lblTotalSales" runat="server" Text="7,044" />
                                </div>
                                <div class="stat-title">Revenue</div>
                            </div>
                        </div>

                        <!-- Two Column Bottom Section -->
                        <div class="dashboard-grid">
                            <!-- Left: Recent Orders -->
                            <div class="white-card">
                                <h2 class="card-heading">Recent Orders</h2>
                                
                                <div class="recent-order-item">
                                    <div class="recent-order-left">
                                        <div class="order-id">ORD-1001</div>
                                        <div class="cust-name">Tirth Kotak</div>
                                    </div>
                                    <div class="recent-order-right">
                                        <div class="order-price">&#8377;1,999</div>
                                        <div class="order-status-text delivered">Delivered</div>
                                    </div>
                                </div>

                                <div class="recent-order-item">
                                    <div class="recent-order-left">
                                        <div class="order-id">ORD-1002</div>
                                        <div class="cust-name">Ansh Patel</div>
                                    </div>
                                    <div class="recent-order-right">
                                        <div class="order-price">&#8377;799</div>
                                        <div class="order-status-text shipped">Shipped</div>
                                    </div>
                                </div>

                                <div class="recent-order-item">
                                    <div class="recent-order-left">
                                        <div class="order-id">ORD-1003</div>
                                        <div class="cust-name">Priya Patel</div>
                                    </div>
                                    <div class="recent-order-right">
                                        <div class="order-price">&#8377;1,299</div>
                                        <div class="order-status-text processing">Processing</div>
                                    </div>
                                </div>

                                <div class="recent-order-item">
                                    <div class="recent-order-left">
                                        <div class="order-id">ORD-1004</div>
                                        <div class="cust-name">Riya Mehta</div>
                                    </div>
                                    <div class="recent-order-right">
                                        <div class="order-price">&#8377;1,848</div>
                                        <div class="order-status-text pending">Pending</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Right: Products Overview -->
                            <div class="white-card">
                                <h2 class="card-heading">Products Overview</h2>

                                <div class="product-overview-item">
                                    <img src="images/product_marble_tshirt.jpg" class="product-overview-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=100';" />
                                    <div class="product-overview-details">
                                        <div class="product-overview-title">Marble Swirl Print T-Shirt</div>
                                        <div class="product-overview-price">&#8377;799</div>
                                    </div>
                                    <div class="product-overview-stock">Stock: 40</div>
                                </div>

                                <div class="product-overview-item">
                                    <img src="images/product_gorilla_tshirt.jpg" class="product-overview-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=100';" />
                                    <div class="product-overview-details">
                                        <div class="product-overview-title">Gorilla Graphic T-Shirt</div>
                                        <div class="product-overview-price">&#8377;649</div>
                                    </div>
                                    <div class="product-overview-stock">Stock: 35</div>
                                </div>

                                <div class="product-overview-item">
                                    <img src="images/product_textiles_hoodie.jpg" class="product-overview-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=100';" />
                                    <div class="product-overview-details">
                                        <div class="product-overview-title">Textiles Signature Hoodie</div>
                                        <div class="product-overview-price">&#8377;1,299</div>
                                    </div>
                                    <div class="product-overview-stock">Stock: 25</div>
                                </div>

                                <div class="product-overview-item">
                                    <img src="images/product_tiger_jacket.jpg" class="product-overview-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=100';" />
                                    <div class="product-overview-details">
                                        <div class="product-overview-title">Tiger Varsity Jacket</div>
                                        <div class="product-overview-price">&#8377;1,999</div>
                                    </div>
                                    <div class="product-overview-stock">Stock: 12</div>
                                </div>

                                <div class="product-overview-item">
                                    <img src="images/product_slim_jeans.jpg" class="product-overview-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1542272604-780c96856592?w=100';" />
                                    <div class="product-overview-details">
                                        <div class="product-overview-title">Slim Fit Blue Jeans</div>
                                        <div class="product-overview-price">&#8377;1,199</div>
                                    </div>
                                    <div class="product-overview-stock">Stock: 50</div>
                                </div>
                            </div>
                        </div>

                    </section>

                    <!-- ================= VIEW 2: PRODUCTS ================= -->
                    <section id="productsView" class="admin-view">
                        
                        <div class="table-action-bar">
                            <div class="table-counter-text">Showing 5 products</div>
                            <button type="button" class="btn-add-primary" onclick="openAddProductModal()">
                                + Add Product
                            </button>
                        </div>

                        <div class="blue-header-table-wrapper">
                            <!-- Live Database GridView with exact Screenshot styling -->
                            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="id" OnRowDeleting="gvProducts_RowDeleting" CssClass="blue-table" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Image" ItemStyle-Width="65px">
                                        <ItemTemplate>
                                            <img src='<%# Eval("image_url") %>' class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=100';" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Product Name" ItemStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="category" HeaderText="Category" ItemStyle-ForeColor="#64748b" />
                                    <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="&#8377;{0:N0}" ItemStyle-CssClass="table-price-bold" />
                                    <asp:BoundField DataField="stock" HeaderText="Stock" ItemStyle-ForeColor="#2e7d32" ItemStyle-Font-Bold="true" />
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="80px">
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" class="btn-action-edit" onclick="openEditProductModal('<%# Eval("name") %>', '<%# Eval("category") %>', '<%# Eval("price") %>', '<%# Eval("stock") %>', '<%# Eval("image_url") %>')">Edit</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="85px">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                                CssClass="btn-action-delete" OnClientClick="return confirm('Are you sure you want to delete this product?');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <!-- Fallback static products row exactly as in Figma screenshot when table is blank -->
                                    <tr style="display:none;"><td></td></tr>
                                </EmptyDataTemplate>
                            </asp:GridView>

                            <!-- Static reference table matching Screenshot 2 when database has 0 items -->
                            <div id="demoProductsTable" style="display:none;">
                                <table class="blue-table">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Product Name</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><img src="images/product_marble_tshirt.jpg" class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=100';" /></td>
                                            <td><strong>Marble Swirl Print T-Shirt</strong></td>
                                            <td style="color:#64748b;">Men</td>
                                            <td class="table-price-bold">&#8377;799</td>
                                            <td style="color:#2e7d32; font-weight:700;">40</td>
                                            <td><button type="button" class="btn-action-edit" onclick="openAddProductModal()">Edit</button></td>
                                            <td><button type="button" class="btn-action-delete" onclick="alert('Demo row cannot be deleted.')">Delete</button></td>
                                        </tr>
                                        <tr>
                                            <td><img src="images/product_gorilla_tshirt.jpg" class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=100';" /></td>
                                            <td><strong>Gorilla Graphic T-Shirt</strong></td>
                                            <td style="color:#64748b;">Men</td>
                                            <td class="table-price-bold">&#8377;649</td>
                                            <td style="color:#2e7d32; font-weight:700;">35</td>
                                            <td><button type="button" class="btn-action-edit" onclick="openAddProductModal()">Edit</button></td>
                                            <td><button type="button" class="btn-action-delete" onclick="alert('Demo row cannot be deleted.')">Delete</button></td>
                                        </tr>
                                        <tr>
                                            <td><img src="images/product_textiles_hoodie.jpg" class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=100';" /></td>
                                            <td><strong>Textiles Signature Hoodie</strong></td>
                                            <td style="color:#64748b;">Men</td>
                                            <td class="table-price-bold">&#8377;1,299</td>
                                            <td style="color:#2e7d32; font-weight:700;">25</td>
                                            <td><button type="button" class="btn-action-edit" onclick="openAddProductModal()">Edit</button></td>
                                            <td><button type="button" class="btn-action-delete" onclick="alert('Demo row cannot be deleted.')">Delete</button></td>
                                        </tr>
                                        <tr>
                                            <td><img src="images/product_tiger_jacket.jpg" class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=100';" /></td>
                                            <td><strong>Tiger Varsity Jacket</strong></td>
                                            <td style="color:#64748b;">Men</td>
                                            <td class="table-price-bold">&#8377;1,999</td>
                                            <td style="color:#2e7d32; font-weight:700;">12</td>
                                            <td><button type="button" class="btn-action-edit" onclick="openAddProductModal()">Edit</button></td>
                                            <td><button type="button" class="btn-action-delete" onclick="alert('Demo row cannot be deleted.')">Delete</button></td>
                                        </tr>
                                        <tr>
                                            <td><img src="images/product_slim_jeans.jpg" class="table-product-thumb" alt="Product" onerror="this.src='https://images.unsplash.com/photo-1542272604-780c96856592?w=100';" /></td>
                                            <td><strong>Slim Fit Blue Jeans</strong></td>
                                            <td style="color:#64748b;">Men</td>
                                            <td class="table-price-bold">&#8377;1,199</td>
                                            <td style="color:#2e7d32; font-weight:700;">50</td>
                                            <td><button type="button" class="btn-action-edit" onclick="openAddProductModal()">Edit</button></td>
                                            <td><button type="button" class="btn-action-delete" onclick="alert('Demo row cannot be deleted.')">Delete</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </section>

                    <!-- ================= VIEW 3: ORDERS ================= -->
                    <section id="ordersView" class="admin-view">
                        
                        <div class="blue-header-table-wrapper">
                            <!-- Live Database GridView -->
                            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="blue-table" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="order_number" HeaderText="Order ID" ItemStyle-CssClass="table-price-bold" />
                                    <asp:BoundField DataField="customer_name" HeaderText="Customer Name" ItemStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="created_at" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-ForeColor="#64748b" />
                                    <asp:BoundField DataField="total_amount" HeaderText="Amount" DataFormatString="&#8377;{0:N0}" ItemStyle-Font-Bold="true" />
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <span class='<%# "status-pill " + Eval("order_status").ToString().ToLower() %>'>
                                                <%# Eval("order_status") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <button type="button" class="btn-action-view" onclick="alert('Order <%# Eval("order_number") %> Details:\nCustomer: <%# Eval("customer_name") %>\nAmount: &#8377;<%# Eval("total_amount") %>\nStatus: <%# Eval("order_status") %>');">View Order</button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <!-- Static reference table matching Screenshot 3 when database has 0 items -->
                            <div id="demoOrdersTable" style="display:none;">
                                <table class="blue-table">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer Name</th>
                                            <th>Date</th>
                                            <th>Amount</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="table-price-bold">ORD-1001</td>
                                            <td><strong>Tirth Kotak</strong></td>
                                            <td style="color:#64748b;">2026-07-28</td>
                                            <td><strong>&#8377;1,999</strong></td>
                                            <td><span class="status-pill delivered">Delivered</span></td>
                                            <td><button type="button" class="btn-action-view" onclick="alert('Order ORD-1001\nCustomer: Tirth Kotak\nTotal: ₹1,999\nStatus: Delivered')">View Order</button></td>
                                        </tr>
                                        <tr>
                                            <td class="table-price-bold">ORD-1002</td>
                                            <td><strong>Ansh Patel</strong></td>
                                            <td style="color:#64748b;">2026-07-30</td>
                                            <td><strong>&#8377;799</strong></td>
                                            <td><span class="status-pill shipped">Shipped</span></td>
                                            <td><button type="button" class="btn-action-view" onclick="alert('Order ORD-1002\nCustomer: Ansh Patel\nTotal: ₹799\nStatus: Shipped')">View Order</button></td>
                                        </tr>
                                        <tr>
                                            <td class="table-price-bold">ORD-1003</td>
                                            <td><strong>Priya Patel</strong></td>
                                            <td style="color:#64748b;">2026-08-01</td>
                                            <td><strong>&#8377;1,299</strong></td>
                                            <td><span class="status-pill processing">Processing</span></td>
                                            <td><button type="button" class="btn-action-view" onclick="alert('Order ORD-1003\nCustomer: Priya Patel\nTotal: ₹1,299\nStatus: Processing')">View Order</button></td>
                                        </tr>
                                        <tr>
                                            <td class="table-price-bold">ORD-1004</td>
                                            <td><strong>Riya Mehta</strong></td>
                                            <td style="color:#64748b;">2026-08-02</td>
                                            <td><strong>&#8377;1,848</strong></td>
                                            <td><span class="status-pill pending">Pending</span></td>
                                            <td><button type="button" class="btn-action-view" onclick="alert('Order ORD-1004\nCustomer: Riya Mehta\nTotal: ₹1,848\nStatus: Pending')">View Order</button></td>
                                        </tr>
                                        <tr>
                                            <td class="table-price-bold">ORD-1005</td>
                                            <td><strong>Harsh Shah</strong></td>
                                            <td style="color:#64748b;">2026-08-03</td>
                                            <td><strong>&#8377;1,199</strong></td>
                                            <td><span class="status-pill delivered">Delivered</span></td>
                                            <td><button type="button" class="btn-action-view" onclick="alert('Order ORD-1005\nCustomer: Harsh Shah\nTotal: ₹1,199\nStatus: Delivered')">View Order</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </section>

                    <!-- ================= VIEW 4: USERS ================= -->
                    <section id="usersView" class="admin-view">
                        
                        <div class="table-action-bar">
                            <div class="table-counter-text">Registered Customers (5 Users)</div>
                        </div>

                        <div class="blue-header-table-wrapper">
                            <table class="blue-table">
                                <thead>
                                    <tr>
                                        <th>User ID</th>
                                        <th>Full Name</th>
                                        <th>Email Address</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="table-price-bold">#USR-101</td>
                                        <td><strong>Tirth Kotak</strong></td>
                                        <td style="color:#64748b;">tirth.kotak@example.com</td>
                                        <td>+91 98251 44520</td>
                                        <td>User</td>
                                        <td><span class="status-pill delivered">Active</span></td>
                                    </tr>
                                    <tr>
                                        <td class="table-price-bold">#USR-102</td>
                                        <td><strong>Ansh Patel</strong></td>
                                        <td style="color:#64748b;">ansh.patel@example.com</td>
                                        <td>+91 99042 18831</td>
                                        <td>User</td>
                                        <td><span class="status-pill delivered">Active</span></td>
                                    </tr>
                                    <tr>
                                        <td class="table-price-bold">#USR-103</td>
                                        <td><strong>Priya Patel</strong></td>
                                        <td style="color:#64748b;">priya.p@example.com</td>
                                        <td>+91 97123 90812</td>
                                        <td>User</td>
                                        <td><span class="status-pill delivered">Active</span></td>
                                    </tr>
                                    <tr>
                                        <td class="table-price-bold">#USR-104</td>
                                        <td><strong>Riya Mehta</strong></td>
                                        <td style="color:#64748b;">riya.mehta@example.com</td>
                                        <td>+91 98980 54321</td>
                                        <td>User</td>
                                        <td><span class="status-pill delivered">Active</span></td>
                                    </tr>
                                    <tr>
                                        <td class="table-price-bold">#USR-105</td>
                                        <td><strong>Harsh Shah</strong></td>
                                        <td style="color:#64748b;">harsh.shah@example.com</td>
                                        <td>+91 94260 11984</td>
                                        <td>User</td>
                                        <td><span class="status-pill delivered">Active</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Live Inquiries / Contact Messages Table -->
                        <div style="margin-top: 26px;">
                            <h2 class="card-heading">Contact Messages Received</h2>
                            <div class="blue-header-table-wrapper">
                                <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" CssClass="blue-table" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-Width="50px" />
                                        <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Font-Bold="true" />
                                        <asp:BoundField DataField="email" HeaderText="Email" />
                                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                        <asp:BoundField DataField="submitted_at" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="padding: 20px; text-align: center; color: #64748b;">
                                            No contact inquiries received yet.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>

                    </section>

                    <!-- ================= VIEW 5: REPORTS ================= -->
                    <section id="reportsView" class="admin-view">
                        
                        <!-- 6 Stat Cards Matching Screenshot 4 -->
                        <div class="stat-cards-grid" style="grid-template-columns: repeat(3, 1fr); margin-bottom: 22px;">
                            <!-- Row 1 -->
                            <div class="stat-card blue">
                                <div class="stat-number">&#8377;7,044</div>
                                <div class="stat-title">Total Sales</div>
                                <div class="stat-subtitle">All orders combined</div>
                            </div>

                            <div class="stat-card green">
                                <div class="stat-number">5</div>
                                <div class="stat-title">Total Orders</div>
                                <div class="stat-subtitle">All time</div>
                            </div>

                            <div class="stat-card orange">
                                <div class="stat-number">5</div>
                                <div class="stat-title">Total Customers</div>
                                <div class="stat-subtitle">Registered users</div>
                            </div>

                            <!-- Row 2 -->
                            <div class="stat-card purple">
                                <div class="stat-number">&#8377;1,409</div>
                                <div class="stat-title">Average Order Value</div>
                                <div class="stat-subtitle">Per order</div>
                            </div>

                            <div class="stat-card teal">
                                <div class="stat-number">162</div>
                                <div class="stat-title">Products in Stock</div>
                                <div class="stat-subtitle">Total units</div>
                            </div>

                            <div class="stat-card red">
                                <div class="stat-number">2</div>
                                <div class="stat-title">Pending Orders</div>
                                <div class="stat-subtitle">Needs attention</div>
                            </div>
                        </div>

                        <!-- Order Status Summary Table Matching Screenshot 4 -->
                        <div class="white-card">
                            <h2 class="card-heading">Order Status Summary</h2>
                            
                            <table class="blue-table" style="box-shadow:none;">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Count</th>
                                        <th>Revenue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Delivered</td>
                                        <td class="table-price-bold">2</td>
                                        <td><strong>&#8377;3,198</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Shipped</td>
                                        <td class="table-price-bold">1</td>
                                        <td><strong>&#8377;799</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Processing</td>
                                        <td class="table-price-bold">1</td>
                                        <td><strong>&#8377;1,299</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Pending</td>
                                        <td class="table-price-bold">1</td>
                                        <td><strong>&#8377;1,848</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </section>

                </div>
            </main>
        </div>

        <!-- ================= ADD / EDIT PRODUCT MODAL WITH VALIDATION ================= -->
        <div id="productModal" class="modal-overlay">
            <div class="modal-box">
                <div class="modal-header">
                    <h3 id="modalTitle">Add New Product</h3>
                    <button type="button" class="modal-close-btn" onclick="closeProductModal()">&times;</button>
                </div>

                <div class="modal-body">
                    <!-- Product Name -->
                    <div class="form-group-item">
                        <label>Product Name <span style="color:#dc2626;">*</span></label>
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-input-ctrl" placeholder="e.g. Classic Linen Shirt" />
                        <span id="errProductName" class="field-validation-error">Product name is required.</span>
                    </div>

                    <!-- Category & Stock -->
                    <div class="form-row-2">
                        <div class="form-group-item">
                            <label>Category <span style="color:#dc2626;">*</span></label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-input-ctrl">
                                <asp:ListItem Text="Shirts" Value="Shirts" />
                                <asp:ListItem Text="T-Shirts" Value="TShirts" />
                                <asp:ListItem Text="Hoodies" Value="Hoodies" />
                                <asp:ListItem Text="Jackets" Value="Jackets" />
                                <asp:ListItem Text="Jeans" Value="Jeans" />
                            </asp:DropDownList>
                            <span id="errCategory" class="field-validation-error">Category is required.</span>
                        </div>

                        <div class="form-group-item">
                            <label>Stock Quantity <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtStock" runat="server" CssClass="form-input-ctrl" placeholder="e.g. 50" />
                            <span id="errStock" class="field-validation-error">Valid positive stock quantity required.</span>
                        </div>
                    </div>

                    <!-- Price & MRP -->
                    <div class="form-row-2">
                        <div class="form-group-item">
                            <label>Selling Price (&#8377;) <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input-ctrl" placeholder="e.g. 799.00" />
                            <span id="errPrice" class="field-validation-error">Valid numeric price is required (e.g. 799).</span>
                        </div>

                        <div class="form-group-item">
                            <label>Original MRP (&#8377;)</label>
                            <asp:TextBox ID="txtOriginalPrice" runat="server" CssClass="form-input-ctrl" placeholder="e.g. 1199.00" />
                            <span id="errOriginalPrice" class="field-validation-error">Please enter a valid numeric amount.</span>
                        </div>
                    </div>

                    <!-- Image URL -->
                    <div class="form-group-item">
                        <label>Image URL <span style="color:#dc2626;">*</span></label>
                        <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-input-ctrl" placeholder="https://... or images/product.jpg" />
                        <span id="errImageUrl" class="field-validation-error">Image URL or path is required.</span>
                    </div>

                    <!-- Description -->
                    <div class="form-group-item">
                        <label>Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-input-ctrl" placeholder="Enter garment fabric, weave, fit details..." />
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-modal-cancel" onclick="closeProductModal()">Cancel</button>
                    <!-- Server Button with Client Validation Trigger -->
                    <asp:Button ID="btnAddProduct" runat="server" Text="Save Product" OnClick="btnAddProduct_Click"
                        OnClientClick="return validateProductForm();" CssClass="btn-add-primary" />
                </div>
            </div>
        </div>

    </form>

    <script>
        // Tab Switcher
        function switchNav(viewName, clickedElement) {
            // Update sidebar links
            document.querySelectorAll('.sidebar-menu a').forEach(function(a) {
                a.classList.remove('active');
            });
            if (clickedElement) {
                clickedElement.classList.add('active');
            }

            // Update visible view
            document.querySelectorAll('.admin-view').forEach(function(view) {
                view.classList.remove('active');
            });
            var targetView = document.getElementById(viewName + 'View');
            if (targetView) {
                targetView.classList.add('active');
            }

            // Update topbar title
            var titles = {
                'dashboard': 'Dashboard',
                'products': 'Products',
                'orders': 'Orders',
                'users': 'Users',
                'reports': 'Reports'
            };
            var topbarTitle = document.getElementById('topbarTitle');
            if (topbarTitle && titles[viewName]) {
                topbarTitle.innerText = titles[viewName];
            }
        }

        // Modal Controls
        function openAddProductModal() {
            document.getElementById('modalTitle').innerText = 'Add New Product';
            document.getElementById('productModal').classList.add('open');
            clearValidation();
        }

        function openEditProductModal(name, cat, price, stock, img) {
            document.getElementById('modalTitle').innerText = 'Edit Product';
            document.getElementById('<%= txtProductName.ClientID %>').value = name || '';
            document.getElementById('<%= ddlCategory.ClientID %>').value = cat || 'Shirts';
            document.getElementById('<%= txtPrice.ClientID %>').value = price || '';
            document.getElementById('<%= txtStock.ClientID %>').value = stock || '';
            document.getElementById('<%= txtImageUrl.ClientID %>').value = img || '';
            document.getElementById('productModal').classList.add('open');
            clearValidation();
        }

        function closeProductModal() {
            document.getElementById('productModal').classList.remove('open');
            clearValidation();
        }

        // Client-side Form Validation
        function validateProductForm() {
            var isValid = true;

            var txtName = document.getElementById('<%= txtProductName.ClientID %>');
            var errName = document.getElementById('errProductName');

            var txtPrice = document.getElementById('<%= txtPrice.ClientID %>');
            var errPrice = document.getElementById('errPrice');

            var txtStock = document.getElementById('<%= txtStock.ClientID %>');
            var errStock = document.getElementById('errStock');

            var txtImg = document.getElementById('<%= txtImageUrl.ClientID %>');
            var errImg = document.getElementById('errImageUrl');

            // 1. Validate Name
            if (!txtName.value || txtName.value.trim() === '') {
                txtName.classList.add('input-error');
                errName.classList.add('show');
                isValid = false;
            } else {
                txtName.classList.remove('input-error');
                errName.classList.remove('show');
            }

            // 2. Validate Price (Must be numeric and > 0)
            var priceVal = parseFloat(txtPrice.value.trim());
            if (!txtPrice.value || isNaN(priceVal) || priceVal <= 0) {
                txtPrice.classList.add('input-error');
                errPrice.classList.add('show');
                isValid = false;
            } else {
                txtPrice.classList.remove('input-error');
                errPrice.classList.remove('show');
            }

            // 3. Validate Stock (Must be integer and >= 0)
            var stockVal = parseInt(txtStock.value.trim(), 10);
            if (!txtStock.value || isNaN(stockVal) || stockVal < 0) {
                txtStock.classList.add('input-error');
                errStock.classList.add('show');
                isValid = false;
            } else {
                txtStock.classList.remove('input-error');
                errStock.classList.remove('show');
            }

            // 4. Validate Image URL
            if (!txtImg.value || txtImg.value.trim() === '') {
                txtImg.classList.add('input-error');
                errImg.classList.add('show');
                isValid = false;
            } else {
                txtImg.classList.remove('input-error');
                errImg.classList.remove('show');
            }

            return isValid;
        }

        function clearValidation() {
            document.querySelectorAll('.form-input-ctrl').forEach(function(inp) {
                inp.classList.remove('input-error');
            });
            document.querySelectorAll('.field-validation-error').forEach(function(err) {
                err.classList.remove('show');
            });
        }

        // Auto display demo table if GridView has 0 rows
        window.addEventListener('DOMContentLoaded', function() {
            var gvProd = document.getElementById('<%= gvProducts.ClientID %>');
            if (!gvProd || gvProd.rows.length <= 1) {
                var demoProd = document.getElementById('demoProductsTable');
                if (demoProd) demoProd.style.display = 'block';
            }

            var gvOrd = document.getElementById('<%= gvOrders.ClientID %>');
            if (!gvOrd || gvOrd.rows.length <= 1) {
                var demoOrd = document.getElementById('demoOrdersTable');
                if (demoOrd) demoOrd.style.display = 'block';
            }
        });
    </script>
</body>
</html>
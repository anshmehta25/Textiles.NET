<%@ Page Title="Processing Payment"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="processing.aspx.cs"
    Inherits="textiles.processing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .processing-wrapper {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .processing-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 50px 45px;
            max-width: 520px;
            width: 100%;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
        }

        .spinner-pulse {
            width: 80px;
            height: 80px;
            margin: 0 auto 24px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .spinner-pulse i {
            font-size: 38px;
            color: #1967d2;
            animation: pulse-grow 1.8s infinite ease-in-out;
        }

        .spinner-ring {
            position: absolute;
            width: 100%;
            height: 100%;
            border: 4px solid #eaf2fb;
            border-top: 4px solid #1967d2;
            border-radius: 50%;
            animation: spin 1.2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes pulse-grow {
            0%, 100% { transform: scale(1); opacity: 0.9; }
            50% { transform: scale(1.15); opacity: 1; }
        }

        .processing-card h1 {
            font-size: 26px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .processing-card p {
            color: #64748b;
            font-size: 14.5px;
            line-height: 1.5;
            margin-bottom: 28px;
        }

        .txn-details-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px 24px;
            text-align: left;
            margin-bottom: 28px;
        }

        .txn-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 13.5px;
        }

        .txn-row:last-child {
            margin-bottom: 0;
        }

        .txn-label {
            color: #64748b;
            font-weight: 500;
        }

        .txn-val {
            color: #1e293b;
            font-weight: 700;
        }

        .progress-bar-container {
            width: 100%;
            height: 8px;
            background: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            position: relative;
        }

        .progress-bar-fill {
            height: 100%;
            background: #1967d2;
            width: 0%;
            animation: fillProgress 2.2s forwards ease-in-out;
        }

        @keyframes fillProgress {
            0% { width: 10%; }
            50% { width: 65%; }
            100% { width: 100%; }
        }
    </style>

    <div class="processing-wrapper">
        <!-- FIGMA FIGURE 9: PROCESSING PAYMENT SCREEN -->
        <div class="processing-card">
            <div class="spinner-pulse">
                <div class="spinner-ring"></div>
                <i class="fa-solid fa-hourglass-half"></i>
            </div>

            <h1>Processing Payment...</h1>
            <p>Please wait while we securely process your transaction. Do not refresh or close this page.</p>

            <div class="txn-details-box">
                <div class="txn-row">
                    <span class="txn-label">Transaction ID:</span>
                    <span class="txn-val"><%= TxnId %></span>
                </div>
                <div class="txn-row">
                    <span class="txn-label">Payment Method:</span>
                    <span class="txn-val"><%= PaymentMethod %></span>
                </div>
                <div class="txn-row">
                    <span class="txn-label">Amount:</span>
                    <span class="txn-val">&#8377; <%= Amount %></span>
                </div>
                <div class="txn-row">
                    <span class="txn-label">Date & Time:</span>
                    <span class="txn-val"><%= DateTimeStr %></span>
                </div>
            </div>

            <div class="progress-bar-container">
                <div class="progress-bar-fill"></div>
            </div>
        </div>
    </div>

    <!-- AUTO REDIRECT SCRIPT AFTER 2.5 SECONDS TO FIGMA FIGURE 10 -->
    <script>
        setTimeout(function () {
            window.location.href = "success.aspx?order=" + encodeURIComponent("<%= OrderNumber %>");
        }, 2400);
    </script>
</asp:Content>

<%@ Page Title="Contact Us"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs"
    Inherits="textiles.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .contact-page {
            max-width: 1180px;
            margin: 0 auto;
            padding: 35px 20px 70px;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h1 {
            font-size: 36px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .contact-header p {
            color: #64748b;
            font-size: 16px;
        }

        .contact-layout {
            display: grid;
            grid-template-columns: 1.3fr 1fr;
            gap: 35px;
            align-items: start;
        }

        /* ================= SEND US A MESSAGE CARD ================= */
        .contact-form-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 35px 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
        }

        .contact-form-card h2 {
            font-size: 24px;
            font-weight: 800;
            color: #1967d2;
            margin-bottom: 8px;
        }

        .contact-form-card p {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            color: #1e293b;
            outline: none;
            transition: border-color 0.2s;
        }

        .form-control:focus {
            border-color: #1967d2;
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        .val-error {
            display: block;
            color: #d32f2f;
            font-size: 12.5px;
            margin-top: 5px;
            font-weight: 500;
        }

        .btn-send-message {
            background: #1967d2;
            color: #ffffff;
            border: none;
            padding: 13px 32px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-send-message:hover {
            background: #1557b0;
        }

        .msg-alert {
            padding: 12px 18px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: block;
            font-size: 14px;
            font-weight: 600;
        }

        .success-message {
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #c8e6c9;
        }

        .error-message {
            background: #ffebee;
            color: #c62828;
            border: 1px solid #ffcdd2;
        }

        /* ================= CONTACT INFO CARDS ================= */
        .contact-info-list {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .info-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 22px 24px;
            display: flex;
            gap: 18px;
            align-items: flex-start;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            transition: transform 0.2s ease;
        }

        .info-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
        }

        .info-icon {
            width: 48px;
            height: 48px;
            background: #eaf2fb;
            color: #1967d2;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .info-content h3 {
            font-size: 16px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .info-content p {
            color: #64748b;
            font-size: 14px;
            line-height: 1.5;
            white-space: pre-line;
        }

        @media (max-width: 900px) {
            .contact-layout {
                grid-template-columns: 1fr;
            }
            .contact-form-card {
                padding: 25px 20px;
            }
        }
    </style>

    <div class="contact-page">
        <!-- HEADER (FIGMA FIGURE 5) -->
        <div class="contact-header">
            <h1>Contact Us</h1>
            <p>We would love to hear from you. Get in touch with our team.</p>
        </div>

        <div class="contact-layout">
            <!-- SEND US A MESSAGE CARD -->
            <div class="contact-form-card">
                <h2>Send Us a Message</h2>
                <p>Fill out the form below and we will respond within 24 business hours.</p>

                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="msg-alert"></asp:Label>

                <div class="form-group">
                    <label>Full Name *</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                        ControlToValidate="txtName" 
                        ErrorMessage="Please enter your full name." 
                        ForeColor="#d32f2f" 
                        Display="Dynamic" 
                        CssClass="val-error" 
                        ValidationGroup="ContactGroup" />
                </div>

                <div class="form-group">
                    <label>Email Address *</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Please enter your email address." 
                        ForeColor="#d32f2f" 
                        Display="Dynamic" 
                        CssClass="val-error" 
                        ValidationGroup="ContactGroup" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ErrorMessage="Please enter a valid email address." 
                        ForeColor="#d32f2f" 
                        Display="Dynamic" 
                        CssClass="val-error" 
                        ValidationGroup="ContactGroup" />
                </div>

                <div class="form-group">
                    <label>Subject *</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="How can we help?"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                        ControlToValidate="txtSubject" 
                        ErrorMessage="Please enter a subject." 
                        ForeColor="#d32f2f" 
                        Display="Dynamic" 
                        CssClass="val-error" 
                        ValidationGroup="ContactGroup" />
                </div>

                <div class="form-group">
                    <label>Your Message *</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-control form-textarea" placeholder="Type your message here..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                        ControlToValidate="txtMessage" 
                        ErrorMessage="Please enter your message." 
                        ForeColor="#d32f2f" 
                        Display="Dynamic" 
                        CssClass="val-error" 
                        ValidationGroup="ContactGroup" />
                </div>

                <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn-send-message" OnClick="btnSend_Click" ValidationGroup="ContactGroup" />
            </div>

            <!-- CONTACT INFO CARDS -->
            <div class="contact-info-list">
                <div class="info-card">
                    <div class="info-icon"><i class="fa-solid fa-location-dot"></i></div>
                    <div class="info-content">
                        <h3>Our Store & HQ</h3>
                        <p>101, Textiles Fashion House, Ring Road,
Rajkot, Gujarat - 360005, India</p>
                    </div>
                </div>

                <div class="info-card">
                    <div class="info-icon"><i class="fa-solid fa-phone"></i></div>
                    <div class="info-content">
                        <h3>Phone Support</h3>
                        <p>+91 98765 43210
Mon – Sat: 9:00 AM – 7:00 PM</p>
                    </div>
                </div>

                <div class="info-card">
                    <div class="info-icon"><i class="fa-solid fa-envelope"></i></div>
                    <div class="info-content">
                        <h3>Email Inquiries</h3>
                        <p>support@onlineclothingstore.com
orders@onlineclothingstore.com</p>
                    </div>
                </div>

                <div class="info-card">
                    <div class="info-icon"><i class="fa-solid fa-clock"></i></div>
                    <div class="info-content">
                        <h3>Working Hours</h3>
                        <p>Monday – Saturday: 9:00 AM – 7:00 PM
Sunday: Closed</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
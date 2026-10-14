<%@ Page Title="Register"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="register.aspx.cs"
    Inherits="textiles.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<style>

    /* ================= REGISTER PAGE ================= */

    .register-page {
        min-height: 700px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px 20px;
        background: #f4f6f9;
    }

    .register-container {
        width: 100%;
        max-width: 500px;
        background: white;
        border-radius: 12px;
        padding: 40px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.12);
    }

    /* ================= HEADER ================= */

    .register-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .register-icon {
        width: 70px;
        height: 70px;
        margin: auto;
        margin-bottom: 15px;
        border-radius: 50%;
        background: #28609d;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 30px;
    }

    .register-header h1 {
        font-size: 28px;
        color: #222;
        margin-bottom: 8px;
    }

    .register-header p {
        color: #777;
        font-size: 14px;
    }

    /* ================= FORM ================= */

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        color: #333;
        margin-bottom: 8px;
        font-size: 14px;
    }

    .form-control {
        width: 100%;
        padding: 13px 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
        outline: none;
        transition: 0.3s;
    }

    .form-control:focus {
        border-color: #28609d;
        box-shadow: 0 0 5px rgba(40,96,157,0.25);
    }

    /* ================= REGISTER BUTTON ================= */

    .register-btn {
        width: 100%;
        background: #28609d;
        color: white;
        border: none;
        padding: 13px;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 5px;
    }

    .register-btn:hover {
        background: #1d4b7c;
    }

    /* ================= DIVIDER ================= */

    .divider {
        display: flex;
        align-items: center;
        margin: 25px 0;
        color: #999;
        font-size: 13px;
    }

    .divider::before,
    .divider::after {
        content: "";
        flex: 1;
        height: 1px;
        background: #ddd;
    }

    .divider span {
        padding: 0 12px;
    }

    /* ================= LOGIN LINK ================= */

    .login-text {
        text-align: center;
        font-size: 14px;
        color: #666;
    }

    .login-text a {
        color: #28609d;
        text-decoration: none;
        font-weight: bold;
    }

    .login-text a:hover {
        text-decoration: underline;
    }

    /* ================= RESPONSIVE ================= */

    @media screen and (max-width: 500px) {

        .register-container {
            padding: 30px 25px;
        }

        .register-page {
            padding: 40px 15px;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

<section class="register-page">

    <div class="register-container">

        <!-- HEADER -->

        <div class="register-header">

            <div class="register-icon">
                <i class="fa-solid fa-user-plus"></i>
            </div>

            <h1>Create Account</h1>

            <p>Join TEXTILES and start shopping today</p>

        </div>

        <asp:Label ID="lblRegisterMsg" runat="server" Visible="false"
            style="display:block; text-align:center; margin-bottom:18px; font-weight:500; font-size:14px; padding:10px 14px; border-radius:6px;">
        </asp:Label>


        <!-- FULL NAME -->

        <div class="form-group">

            <label>Full Name</label>

            <asp:TextBox
                ID="txtName"
                runat="server"
                CssClass="form-control"
                placeholder="Enter your full name">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvName" 
                runat="server" 
                ControlToValidate="txtName" 
                ErrorMessage="Full name is required." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RequiredFieldValidator>

        </div>


        <!-- EMAIL -->

        <div class="form-group">

            <label>Email Address</label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="form-control"
                TextMode="Email"
                placeholder="Enter your email address">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvEmail" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage="Email address is required." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator 
                ID="revEmail" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ErrorMessage="Please enter a valid email address." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RegularExpressionValidator>

        </div>


        <!-- PHONE -->

        <div class="form-group">

            <label>Phone Number</label>

            <asp:TextBox
                ID="txtPhone"
                runat="server"
                CssClass="form-control"
                TextMode="Phone"
                placeholder="Enter your phone number">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvPhone" 
                runat="server" 
                ControlToValidate="txtPhone" 
                ErrorMessage="Phone number is required." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator 
                ID="revPhone" 
                runat="server" 
                ControlToValidate="txtPhone" 
                ValidationExpression="^[0-9]{10}$" 
                ErrorMessage="Phone number must be exactly 10 digits." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RegularExpressionValidator>

        </div>


        <!-- PASSWORD -->

        <div class="form-group">

            <label>Password</label>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                CssClass="form-control"
                TextMode="Password"
                placeholder="Create a password">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvPassword" 
                runat="server" 
                ControlToValidate="txtPassword" 
                ErrorMessage="Password is required." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator 
                ID="revPassword" 
                runat="server" 
                ControlToValidate="txtPassword" 
                ValidationExpression="^.{6,}$" 
                ErrorMessage="Password must be at least 6 characters." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RegularExpressionValidator>

        </div>


        <!-- CONFIRM PASSWORD -->

        <div class="form-group">

            <label>Confirm Password</label>

            <asp:TextBox
                ID="txtConfirmPassword"
                runat="server"
                CssClass="form-control"
                TextMode="Password"
                placeholder="Confirm your password">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvConfirmPassword" 
                runat="server" 
                ControlToValidate="txtConfirmPassword" 
                ErrorMessage="Confirm password is required." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RequiredFieldValidator>

            <asp:CompareValidator 
                ID="cvConfirmPassword" 
                runat="server" 
                ControlToValidate="txtConfirmPassword" 
                ControlToCompare="txtPassword" 
                ErrorMessage="Passwords do not match." 
                ValidationGroup="RegisterGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:CompareValidator>

        </div>


        <!-- REGISTER BUTTON -->

        <asp:Button
            ID="btnRegister"
            runat="server"
            Text="Create Account"
            CssClass="register-btn"
            ValidationGroup="RegisterGroup"
            CausesValidation="true"
            OnClick="btnRegister_Click" />


        <!-- DIVIDER -->

        <div class="divider">

            <span>OR</span>

        </div>


        <!-- LOGIN -->

        <div class="login-text">

            Already have an account?

            <a href="login.aspx">
                Login Here
            </a>

        </div>

    </div>

</section>

</asp:Content>
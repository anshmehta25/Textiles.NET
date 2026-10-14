<%@ Page Title="Forgot Password"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="forgotpassword.aspx.cs"
    Inherits="textiles.forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<style>

    .forgot-page {
        min-height: 650px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px 20px;
        background: #f4f6f9;
    }

    .forgot-container {
        width: 100%;
        max-width: 430px;
        background: white;
        border-radius: 12px;
        padding: 40px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.12);
    }

    .forgot-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .forgot-icon {
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

    .forgot-header h1 {
        font-size: 27px;
        color: #222;
        margin-bottom: 10px;
    }

    .forgot-header p {
        color: #777;
        font-size: 14px;
        line-height: 1.6;
    }

    .form-group {
        margin-bottom: 20px;
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
        box-sizing: border-box;
    }

    .form-control:focus {
        border-color: #28609d;
        box-shadow: 0 0 5px rgba(40,96,157,0.25);
    }

    .reset-btn {
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
    }

    .reset-btn:hover {
        background: #1d4b7c;
    }

    .back-login {
        text-align: center;
        margin-top: 25px;
        font-size: 14px;
    }

    .back-login a {
        color: #28609d;
        text-decoration: none;
        font-weight: bold;
    }

    .back-login a:hover {
        text-decoration: underline;
    }

</style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

<section class="forgot-page">

    <div class="forgot-container">

        <div class="forgot-header">

            <div class="forgot-icon">
                <i class="fa-solid fa-key"></i>
            </div>

            <h1>Forgot Password?</h1>

            <p>
                Don't worry! Enter your email address and
                we will help you reset your password.
            </p>

        </div>

        <asp:Label ID="lblForgotMsg" runat="server" Visible="false"
            style="display:block; text-align:center; margin-bottom:18px; font-weight:500; font-size:14px; padding:10px 14px; border-radius:6px;">
        </asp:Label>

        <div class="form-group">

            <label>Email Address</label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="form-control"
                TextMode="Email"
                placeholder="Enter your registered email">
            </asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="rfvEmail" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage="Email address is required." 
                ValidationGroup="ForgotGroup" 
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
                ValidationGroup="ForgotGroup" 
                ForeColor="#dc3545" 
                Display="Dynamic" 
                style="font-size:13px; margin-top:5px; display:block;">
            </asp:RegularExpressionValidator>

        </div>


        <asp:Button
            ID="btnReset"
            runat="server"
            Text="Send Reset Link"
            CssClass="reset-btn"
            ValidationGroup="ForgotGroup"
            CausesValidation="true"
            OnClick="btnReset_Click" />


        <div class="back-login">

            <a href="login.aspx">
                <i class="fa-solid fa-arrow-left"></i> Back to Login
            </a>

        </div>

    </div>

</section>

</asp:Content>
<%@ Page Title="Login"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="login.aspx.cs"
    Inherits="textiles.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style>

        .login-page {
            min-height: 650px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 20px;
            background: #f4f6f9;
        }

        .login-container {
            width: 100%;
            max-width: 430px;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-icon {
            width: 65px;
            height: 65px;
            margin: auto;
            margin-bottom: 15px;
            border-radius: 50%;
            background: #28609d;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 28px;
        }

        .login-header h1 {
            font-size: 28px;
            color: #222;
            margin-bottom: 8px;
        }

        .login-header p {
            color: #777;
            font-size: 14px;
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
        }

        .form-control:focus {
            border-color: #28609d;
            box-shadow: 0 0 5px rgba(40,96,157,0.25);
        }

        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .remember {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .forgot-password {
            color: #28609d;
            text-decoration: none;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .login-btn {
            width: 100%;
            background: #28609d;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #1d4b7c;
        }

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

        .register-text {
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .register-text a {
            color: #28609d;
            text-decoration: none;
            font-weight: bold;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 500px) {

            .login-container {
                padding: 30px 25px;
            }

            .login-page {
                padding: 40px 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section class="login-page">

        <div class="login-container">

            <!-- HEADER -->

            <div class="login-header">

                <div class="login-icon">
                    <i class="fa-solid fa-user-lock"></i>
                </div>

                <h1>Welcome Back</h1>

                <p>Login to continue shopping at TEXTILES</p>

            </div>

            <asp:Label ID="lblLoginError" runat="server" Visible="false" ForeColor="#dc3545"
                style="display:block; text-align:center; margin-bottom:18px; font-weight:500; font-size:14px; background:#f8d7da; padding:10px 14px; border-radius:6px; border:1px solid #f5c6cb;">
            </asp:Label>


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
                    ValidationGroup="LoginGroup"
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
                    ValidationGroup="LoginGroup"
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
                    placeholder="Enter your password">
                </asp:TextBox>

                <asp:RequiredFieldValidator 
                    ID="rfvPassword" 
                    runat="server" 
                    ControlToValidate="txtPassword"
                    ErrorMessage="Password is required." 
                    ValidationGroup="LoginGroup"
                    ForeColor="#dc3545" 
                    Display="Dynamic" 
                    style="font-size:13px; margin-top:5px; display:block;">
                </asp:RequiredFieldValidator>

            </div>


            <!-- REMEMBER -->

            <div class="login-options">

                <div class="remember">

                    <asp:CheckBox
                        ID="chkRemember"
                        runat="server" />

                    <span>Remember Me</span>

                </div>


                <a href="forgotpassword.aspx" class="forgot-password">
                         Forgot Password?
                </a>

            </div>


            <!-- LOGIN BUTTON -->

            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="login-btn"
                ValidationGroup="LoginGroup"
                CausesValidation="true"
                OnClick="btnLogin_Click" />


            <!-- DIVIDER -->

            <div class="divider">

                <span>OR</span>

            </div>


            <!-- REGISTER -->

            <div class="register-text">

                Don't have an account?

                <a href="register.aspx">
                    Create Account

                </a>


                <div>               
                        <a href="admin.aspx"> Admin panal </a>
                 </div>

            </div>

        </div>

    </section>

</asp:Content>
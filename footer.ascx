<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="textiles.footer_control" %>

<style>
    /* ================= FOOTER ================= */
    .footer {
        background: #1e3a8a;
        color: #ffffff;
        padding-top: 50px;
        margin-top: 50px;
    }

    .footer-container {
        width: 90%;
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 40px;
        padding-bottom: 40px;
    }

    .footer-col h3 {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #ffffff;
        position: relative;
    }

    .footer-col h3::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -6px;
        width: 35px;
        height: 2px;
        background: #4a90e2;
    }

    .footer-brand {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 15px;
    }

    .footer-logo {
        width: 42px;
        height: 35px;
        background: white;
        border-radius: 4px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        font-weight: bold;
        color: #28609d;
    }

    .footer-brand-title {
        color: white;
        font-size: 20px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    .footer-col p {
        line-height: 1.6;
        margin-bottom: 15px;
        color: #b0c4de;
    }

    .footer-links {
        list-style: none;
    }

    .footer-links li {
        margin-bottom: 10px;
    }

    .footer-links a {
        color: #b0c4de;
        text-decoration: none;
        transition: color 0.3s, padding-left 0.3s;
        display: inline-block;
    }

    .footer-links a:hover {
        color: #ffffff;
        padding-left: 5px;
    }

    .footer-contact-item {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        margin-bottom: 12px;
        color: #b0c4de;
    }

    .footer-contact-item span {
        color: #ffffff;
    }

    .footer-bottom {
        background: #132e4c;
        text-align: center;
        padding: 20px 0;
        color: #8da4be;
        font-size: 13px;
        border-top: 1px solid rgba(255,255,255,0.08);
    }

    .footer-bottom p {
        margin: 0;
    }

    @media screen and (max-width: 992px) {
        .footer-container {
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }
    }

    @media screen and (max-width: 600px) {
        .footer-container {
            grid-template-columns: 1fr;
            width: 92%;
        }
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <!-- BRAND COLUMN -->
        <div class="footer-col">
            <div class="footer-brand">
                <div class="footer-logo">#</div>
                <span class="footer-brand-title">TEXTILES</span>
            </div>
            <p>
                Your ultimate destination for premium apparel. From classic hoodies and jackets to stylish graphic tees and denim, we offer quality clothing crafted for comfort and confidence.
            </p>
        </div>

        <!-- QUICK LINKS -->
        <div class="footer-col">
            <h3>Quick Links</h3>
            <ul class="footer-links">
                <li><a href="index.aspx">Home</a></li>
                <li><a href="product.aspx">All Products</a></li>
                <li><a href="about.aspx">About Us</a></li>
                <li><a href="contact.aspx">Contact Us</a></li>
                <li><a href="cart.aspx">Shopping Cart</a></li>
            </ul>
        </div>

        <!-- CUSTOMER CARE -->
        <div class="footer-col">
            <h3>Customer Care</h3>
            <ul class="footer-links">
                <li><a href="#">Order Tracking</a></li>
                <li><a href="#">Shipping &amp; Delivery</a></li>
                <li><a href="#">Returns &amp; Exchange</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms &amp; Conditions</a></li>
            </ul>
        </div>

        <!-- CONTACT INFO -->
        <div class="footer-col">
            <h3>Contact Us</h3>
            <div class="footer-contact-item">
                <span>📍</span>
                <p>123 Fashion Street, Textile Hub, City - 380001</p>
            </div>
            <div class="footer-contact-item">
                <span>📞</span>
                <p>+91 98765 43210</p>
            </div>
            <div class="footer-contact-item">
                <span>✉️</span>
                <p>support@textiles.com</p>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2026 TEXTILES. All Rights Reserved.</p>
    </div>
</footer>

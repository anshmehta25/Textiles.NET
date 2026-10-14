<%@ Page Title="About Us"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="About.aspx.cs"
    Inherits="textiles.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-page {
            max-width: 1200px;
            margin: 0 auto;
            padding: 35px 20px 70px;
        }

        .about-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .about-header h1 {
            font-size: 36px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .about-header p {
            color: #64748b;
            font-size: 16px;
        }

        /* ================= WHO WE ARE ================= */
        .who-we-are {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
        }

        .who-text {
            flex: 1.2;
            padding: 45px;
        }

        .who-text h2 {
            font-size: 26px;
            font-weight: 800;
            color: #1967d2;
            margin-bottom: 16px;
            position: relative;
            display: inline-block;
        }

        .who-text p {
            color: #475569;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 16px;
        }

        .who-img {
            flex: 1;
            height: 380px;
            overflow: hidden;
        }

        .who-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* ================= OUR MISSION ================= */
        .mission-box {
            background: linear-gradient(135deg, #1967d2 0%, #1557b0 100%);
            border-radius: 16px;
            padding: 40px 45px;
            color: #ffffff;
            text-align: center;
            margin-bottom: 50px;
            box-shadow: 0 8px 25px rgba(25, 103, 210, 0.18);
        }

        .mission-box h2 {
            font-size: 22px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 12px;
            opacity: 0.9;
        }

        .mission-box p {
            font-size: 20px;
            font-weight: 600;
            line-height: 1.5;
            max-width: 800px;
            margin: 0 auto;
        }

        /* ================= WHY CHOOSE US ================= */
        .section-title-center {
            text-align: center;
            margin-bottom: 35px;
        }

        .section-title-center h2 {
            font-size: 28px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .section-title-center p {
            color: #64748b;
            font-size: 15px;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 60px;
        }

        .feature-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 30px 22px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border-color: #cbd5e1;
        }

        .feature-icon {
            width: 56px;
            height: 56px;
            background: #eaf2fb;
            color: #1967d2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin: 0 auto 18px;
        }

        .feature-card h3 {
            font-size: 17px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 10px;
        }

        .feature-card p {
            font-size: 13.5px;
            color: #64748b;
            line-height: 1.5;
        }

        /* ================= MEET OUR TEAM ================= */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .team-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 35px 25px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            transition: transform 0.3s ease;
        }

        .team-card:hover {
            transform: translateY(-4px);
            border-color: #cbd5e1;
        }

        .team-avatar {
            width: 80px;
            height: 80px;
            background: #eaf2fb;
            color: #1967d2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            margin: 0 auto 16px;
            border: 2px solid #cbd5e1;
        }

        .team-card h3 {
            font-size: 19px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .team-role {
            font-size: 13px;
            font-weight: 600;
            color: #1967d2;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 12px;
        }

        .team-card p {
            font-size: 14px;
            color: #64748b;
            line-height: 1.5;
        }

        @media (max-width: 900px) {
            .who-we-are {
                flex-direction: column;
            }
            .who-img {
                width: 100%;
                height: 240px;
            }
            .features-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .team-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="about-page">
        <!-- HEADER -->
        <div class="about-header">
            <h1>About Us</h1>
            <p>Crafting quality fashion for the modern individual</p>
        </div>

        <!-- WHO WE ARE (FIGMA FIGURE 4) -->
        <section class="who-we-are">
            <div class="who-text">
                <h2>Who We Are</h2>
                <p>Founded in 2026, Textiles is a contemporary clothing brand dedicated to delivering exceptional quality, trendsetting designs, and effortless comfort. What began as a passionate design project has grown into an online shopping destination trusted by thousands of fashion-conscious men across India.</p>
                <p>Our collections are thoughtfully curated, blending urban streetwear aesthetics with timeless casual sophistication. Every piece—from graphic tees and hoodies to jackets and tailored denim—is crafted with obsessive attention to detail, premium fabrics, and ethical manufacturing practices.</p>
            </div>
            <div class="who-img">
                <img src="images/about_store_rack.jpg" alt="Textiles Boutique Collection Rack" onerror="this.src='images/product_marble_tshirt.jpg'" />
            </div>
        </section>

        <!-- OUR MISSION -->
        <section class="mission-box">
            <h2>Our Mission</h2>
            <p>"To empower individuals to express their authentic personality through accessible, high-quality, and sustainably made fashion."</p>
        </section>

        <!-- WHY CHOOSE US -->
        <div class="section-title-center">
            <h2>Why Choose Us</h2>
            <p>The core values that distinguish our brand experience</p>
        </div>

        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="fa-solid fa-shirt"></i></div>
                <h3>Premium Fabrics</h3>
                <p>100% combed cotton, bio-washed fleece, and durable denim that feels softer and lasts longer.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fa-solid fa-wand-magic-sparkles"></i></div>
                <h3>Modern Aesthetics</h3>
                <p>Contemporary streetwear and casual wear designed to turn heads and keep you comfortable.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fa-solid fa-tag"></i></div>
                <h3>Affordable Luxury</h3>
                <p>Direct-to-consumer pricing ensures top-tier quality without the luxury brand markups.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fa-solid fa-truck-fast"></i></div>
                <h3>Fast & Reliable Delivery</h3>
                <p>Prompt nationwide shipping with secure packaging and real-time order tracking.</p>
            </div>
        </div>

        <!-- MEET OUR TEAM -->
        <div class="section-title-center">
            <h2>Meet Our Team</h2>
            <p>The visionaries behind Textiles Online Clothing Store</p>
        </div>

        <div class="team-grid">
            <div class="team-card">
                <div class="team-avatar"><i class="fa-solid fa-user-tie"></i></div>
                <h3>Tirth Kotak</h3>
                <div class="team-role">Lead Designer & Founder</div>
                <p>Passionate about streetwear aesthetics, fabric innovation, and visionary fashion design.</p>
            </div>
            <div class="team-card">
                <div class="team-avatar"><i class="fa-solid fa-user-gear"></i></div>
                <h3>Ansh Patel</h3>
                <div class="team-role">Operations & Supply Chain</div>
                <p>Ensuring ethical sourcing, high-speed logistics, and flawless product quality control.</p>
            </div>
            <div class="team-card">
                <div class="team-avatar"><i class="fa-solid fa-user-check"></i></div>
                <h3>Harsh Shah</h3>
                <div class="team-role">Tech & Customer Experience</div>
                <p>Architecting seamless digital commerce and ensuring world-class customer satisfaction.</p>
            </div>
        </div>
    </div>
</asp:Content>
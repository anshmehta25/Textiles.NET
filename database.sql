-- =======================================================
-- TEXTILES Web Application Microsoft SQL Server Database Schema
-- Database Name: textiles_net or local textiles.mdf
-- =======================================================

-- 1. USERS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'users')
BEGIN
    CREATE TABLE users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        email NVARCHAR(100) NOT NULL UNIQUE,
        phone NVARCHAR(20),
        password NVARCHAR(100) NOT NULL,
        address NVARCHAR(MAX),
        role NVARCHAR(20) DEFAULT 'user',
        created_at DATETIME DEFAULT GETDATE()
    );
END;

-- 2. ADMIN USERS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'admin_users')
BEGIN
    CREATE TABLE admin_users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(50) NOT NULL UNIQUE,
        email NVARCHAR(100) NOT NULL UNIQUE,
        password NVARCHAR(100) NOT NULL,
        role NVARCHAR(20) DEFAULT 'admin',
        created_at DATETIME DEFAULT GETDATE()
    );
END;

-- 3. PRODUCTS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'products')
BEGIN
    CREATE TABLE products (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(150) NOT NULL,
        category NVARCHAR(50) NOT NULL,
        price DECIMAL(10,2) NOT NULL,
        original_price DECIMAL(10,2) DEFAULT 0.00,
        rating DECIMAL(3,1) DEFAULT 4.5,
        image_url NVARCHAR(255),
        description NVARCHAR(MAX),
        stock INT DEFAULT 50,
        is_featured INT DEFAULT 1,
        created_at DATETIME DEFAULT GETDATE()
    );
END;

-- 4. CART TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'cart')
BEGIN
    CREATE TABLE cart (
        id INT IDENTITY(1,1) PRIMARY KEY,
        user_email NVARCHAR(100) NOT NULL,
        product_id INT NOT NULL,
        product_name NVARCHAR(150),
        price DECIMAL(10,2),
        image_url NVARCHAR(255),
        quantity INT DEFAULT 1,
        size NVARCHAR(10) DEFAULT 'M',
        added_at DATETIME DEFAULT GETDATE()
    );
END;

-- 5. ORDERS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'orders')
BEGIN
    CREATE TABLE orders (
        id INT IDENTITY(1,1) PRIMARY KEY,
        order_number NVARCHAR(50) NOT NULL UNIQUE,
        user_email NVARCHAR(100) NOT NULL,
        customer_name NVARCHAR(100) NOT NULL,
        phone NVARCHAR(20),
        address NVARCHAR(MAX),
        total_amount DECIMAL(10,2) NOT NULL,
        payment_method NVARCHAR(50) DEFAULT 'COD',
        payment_status NVARCHAR(20) DEFAULT 'Pending',
        order_status NVARCHAR(20) DEFAULT 'Processing',
        created_at DATETIME DEFAULT GETDATE()
    );
END;

-- 6. ORDER ITEMS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'order_items')
BEGIN
    CREATE TABLE order_items (
        id INT IDENTITY(1,1) PRIMARY KEY,
        order_id INT NOT NULL,
        product_id INT NOT NULL,
        product_name NVARCHAR(150),
        price DECIMAL(10,2),
        quantity INT DEFAULT 1,
        size NVARCHAR(10) DEFAULT 'M',
        total DECIMAL(10,2),
        FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
    );
END;

-- 7. CONTACT SUBMISSIONS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contact_submissions')
BEGIN
    CREATE TABLE contact_submissions (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        email NVARCHAR(100) NOT NULL,
        subject NVARCHAR(150),
        message NVARCHAR(MAX) NOT NULL,
        submitted_at DATETIME DEFAULT GETDATE()
    );
END;

-- =======================================================
-- SEED DEFAULT ADMIN & TEST USER DATA & PRODUCTS
-- =======================================================

IF NOT EXISTS (SELECT 1 FROM users WHERE email = 'admin@textiles.com')
BEGIN
    INSERT INTO users (name, email, phone, password, role) 
    VALUES ('Administrator', 'admin@textiles.com', '9876543210', 'admin123', 'admin');
END;

IF NOT EXISTS (SELECT 1 FROM admin_users WHERE username = 'admin')
BEGIN
    INSERT INTO admin_users (username, email, password, role) 
    VALUES ('admin', 'admin@textiles.com', 'admin123', 'admin');
END;

IF NOT EXISTS (SELECT 1 FROM products WHERE name = 'Men''s Royal Linen Shirt')
BEGIN
    INSERT INTO products (name, category, price, original_price, rating, image_url, description, stock, is_featured)
    VALUES 
    ('Men''s Royal Linen Shirt', 'Shirts', 999.00, 1499.00, 4.8, 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=600', '100% natural organic linen casual shirt in soothing pastel shades with tailored comfort fit.', 60, 1),
    ('Men''s Designer Denim Jacket', 'Jackets', 2499.00, 3299.00, 4.9, 'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=600', 'Dark indigo classic denim jacket with brass buttons, durable stitching, and dual chest pockets.', 45, 1),
    ('Men''s Classic Cotton Graphic Tee', 'TShirts', 799.00, 1199.00, 4.6, 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=600', 'Premium combed cotton crew-neck graphic t-shirt. Breathable, lightweight, and versatile everyday style.', 80, 1),
    ('Men''s Fleece Pullover Hoodie', 'Hoodies', 1599.00, 2299.00, 4.7, 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=600', 'Warm, heavy-blend fleece pullover hoodie with kangaroo pocket and adjustable drawstring hood.', 50, 1),
    ('Men''s Slim Fit Stretch Denim Jeans', 'Jeans', 1799.00, 2499.00, 4.7, 'https://images.unsplash.com/photo-1542272604-780c96856592?w=600', 'Mid-rise slim fit washed denim jeans with comfort stretch fabric and clean 5-pocket styling.', 55, 1),
    ('Men''s Oxford Button-Down Shirt', 'Shirts', 1299.00, 1899.00, 4.8, 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=600', 'Crisp formal Oxford cotton shirt with button-down collar and regular modern tailoring.', 40, 1),
    ('Men''s Urban Streetwear Bomber Jacket', 'Jackets', 2899.00, 3999.00, 4.8, 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=600', 'Sleek zip-up bomber jacket with ribbed collar, cuffs, and water-resistant finish.', 30, 1),
    ('Men''s Solid Pique Polo T-Shirt', 'TShirts', 899.00, 1399.00, 4.5, 'https://images.unsplash.com/photo-1625910513413-7a2e0a242f2b?w=600', 'Breathable pique cotton knit polo shirt with ribbed collar and button placket.', 65, 1),
    ('Men''s Winter Zip-Up Hooded Sweatshirt', 'Hoodies', 1899.00, 2699.00, 4.7, 'https://images.unsplash.com/photo-1509967419530-da38b4704bc6?w=600', 'Thermal zip-front hooded sweatshirt made from ultra-soft cotton fleece for colder seasons.', 35, 1);
END;




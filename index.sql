CREATE DATABASE productdb;

USE productdb;

CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL  
   );



CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10, 2) NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
    
);

CREATE TABLE product_category (
    product_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    product_id INT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL  
);

CREATE TABLE size_option (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_name VARCHAR(20) NOT NULL,  
    size_category_id INT NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL 
   
);


CREATE TABLE product_variation (
    product_variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    size_id INT,
    color_id INT,
    variation VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);


CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_variation_id INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(product_variation_id
);
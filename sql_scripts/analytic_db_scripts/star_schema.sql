CREATE TABLE analitics_data.dim_customers (
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32) UNIQUE NOT NULL,
    customer_zip_code_prefix VARCHAR(7),
    customer_city VARCHAR(50),
    customer_state CHAR(2)
);


CREATE TABLE analitics_data.dim_products (
    product_id VARCHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(50),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);


CREATE TABLE analitics_data.dim_sellers (
    seller_id VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(7),
    seller_city VARCHAR(50),
    seller_state CHAR(2)
);


CREATE TABLE analitics_data.fact_orders (
    order_id VARCHAR(32) PRIMARY KEY,
    customer_id VARCHAR(32),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME2,
    order_approved_at DATETIME2,
    order_delivered_carrier_date DATETIME2,
    order_delivered_customer_date DATETIME2,
    order_estimated_delivery_date DATETIME2,
    FOREIGN KEY (customer_id) REFERENCES analitics_data.dim_customers(customer_id)
);


CREATE TABLE analitics_data.dim_order_items (
    order_item_id VARCHAR(32) PRIMARY KEY,
    order_id VARCHAR(32) NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    seller_id VARCHAR(32) NOT NULL,
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES analitics_data.fact_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES analitics_data.dim_products(product_id),
    FOREIGN KEY (seller_id) REFERENCES analitics_data.dim_sellers(seller_id)
);
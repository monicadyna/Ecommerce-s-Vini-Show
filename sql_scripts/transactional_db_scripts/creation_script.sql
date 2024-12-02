CREATE TABLE transac_data.products
(
      product_id VARCHAR(32) PRIMARY KEY
    , product_category_name VARCHAR(50)
    , product_name_length INT
    , product_description_length INT
    , product_photos_qty INT
    , product_weight_g INT
    , product_length_cm INT
    , product_height_cm INT
    , product_width_cm INT
);


CREATE TABLE transac_data.geolocation
(
    geolocation_zip_code_prefix VARCHAR(7) PRIMARY KEY
    , geolocation_lat DECIMAL(8, 6)
    , geolocation_lng DECIMAL(9, 6)
    , geolocation_city VARCHAR(50)
    , geolocation_state CHAR(2)
);


CREATE TABLE transac_data.product_category_name_translation
(
    id INT IDENTITY PRIMARY KEY
    , product_category_name VARCHAR(50) NOT NULL
    , product_category_name_english VARCHAR(50)
);


CREATE TABLE transac_data.sellers
(
      seller_id VARCHAR(32) PRIMARY KEY
    , seller_zip_code_prefix VARCHAR(7)
    , seller_city VARCHAR(50)
    , seller_state CHAR(2)
    , FOREIGN KEY (seller_zip_code_prefix) REFERENCES transac_data.geolocation(geolocation_zip_code_prefix)
);


CREATE TABLE transac_data.customer
(
    customer_id VARCHAR(32) UNIQUE NOT NULL
    , customer_unique_id VARCHAR(32) UNIQUE NOT NULL
    , customer_zip_code_prefix VARCHAR(7)
    , customer_city VARCHAR(50)
    , customer_state CHAR(2)
    , PRIMARY KEY (customer_id, customer_unique_id)
    , FOREIGN KEY (customer_zip_code_prefix) REFERENCES transac_data.geolocation(geolocation_zip_code_prefix)
);


CREATE TABLE transac_data.orders
(
    order_id VARCHAR(32) UNIQUE NOT NULL
    , customer_id VARCHAR(32) NOT NULL
    , order_status VARCHAR(20)
    , order_purchase_timestamp DATETIME
    , order_approved_at DATETIME
    , order_delivered_carrier_date DATETIME
    , order_delivered_customer_date DATETIME
    , order_estimated_delivery_date DATE
    , PRIMARY KEY (order_id, customer_id)
    , FOREIGN KEY (customer_id) REFERENCES transac_data.customer(customer_id)
);


CREATE TABLE transac_data.payments
(
      order_id VARCHAR(32) PRIMARY KEY
    , payment_sequential INT
    , payment_type VARCHAR(20)
    , payment_installments INT
    , payment_value DECIMAL(10, 2)
    , FOREIGN KEY (order_id) REFERENCES transac_data.orders(order_id)
); 


CREATE TABLE transac_data.order_reviews
(
      review_id VARCHAR(32) NOT NULL
    , order_id VARCHAR(32) NOT NULL
    , review_score INT
    , review_comment_title VARCHAR(50)
    , review_comment_message VARCHAR(255)
    , review_creation_date DATE
    , review_answer_timestamp DATETIME
    , PRIMARY KEY (review_id, order_id)
    , FOREIGN KEY (order_id) REFERENCES transac_data.orders(order_id)
);


CREATE TABLE transac_data.order_items
(
      order_id VARCHAR(32) NOT NULL
    , order_item_id INT
    , product_id VARCHAR(32)
    , seller_id VARCHAR(32)
    , shipping_limit_date DATETIME
    , price DECIMAL(7, 2)
    , freight_value DECIMAL(6, 2)
    , PRIMARY KEY (order_id, order_item_id, product_id, seller_id)
    , FOREIGN KEY (seller_id) REFERENCES transac_data.sellers(seller_id)
    , FOREIGN KEY (product_id) REFERENCES transac_data.products(product_id)
    , FOREIGN KEY (order_id) REFERENCES transac_data.orders(order_id)
);

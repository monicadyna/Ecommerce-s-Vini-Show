CREATE TABLE orders
(
    id INT AUTO_INCREMENT PRIMARY KEY
    order_id VARCHAR(32) NOT NULL
    , customer_id VARCHAR(32) NOT NULL
    , order_status VARCHAR(20)
    , order_purchase_timestamp DATETIME
    , order_approved_at DATETIME
    , order_delivered_carrier_date DATETIME
    , order_delivered_customer_date DATETIME
    , order_estimated_delivery_date DATE
    , PRIMARY KEY (id)
);

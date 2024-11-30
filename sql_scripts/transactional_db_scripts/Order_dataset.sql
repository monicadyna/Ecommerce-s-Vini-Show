CREATE TABLE orders
(
    order_id VARCHAR(32) NOT NULL
    , customer_id VARCHAR(32) NOT NULL
    , order_status VARCHAR(20)
    , order_purchase_timestamp TIMESTAMP
    , order_approved_at TIMESTAMP
    , order_delivered_carrier_date DATE
    , order_delivered_customer_date DATE
    , order_estimated_delivery_date DATE
    , PRIMARY KEY (order_id)
);

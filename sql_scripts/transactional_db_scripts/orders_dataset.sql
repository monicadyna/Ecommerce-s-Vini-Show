CREATE TABLE IF NOT EXISTS transac_data.orders
(
    order_id VARCHAR(32) NOT NULL
    , customer_id VARCHAR(32) NOT NULL
    , order_status VARCHAR(20)
    , order_purchase_timestamp DATETIME
    , order_approved_at DATETIME
    , order_delivered_carrier_date DATETIME
    , order_delivered_customer_date DATETIME
    , order_estimated_delivery_date DATE
    , PRIMARY KEY (order_id, customer_id)
);

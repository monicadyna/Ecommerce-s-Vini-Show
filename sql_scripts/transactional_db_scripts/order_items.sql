CREATE TABLE IF NOT EXISTS transac_data.orders
(
      order_id VARCHAR(32) NOT NULL
    , order_item_id INT
    , product_id VARCHAR(32)
    , seller_id VARCHAR(32)
    , shipping_limit_date DATETIME
    , price DECIMAL(7, 2)
    , freight_value DECIMAL(6, 2)
    , PRIMARY KEY (order_id, order_item_id, product_id, seller_id)
);

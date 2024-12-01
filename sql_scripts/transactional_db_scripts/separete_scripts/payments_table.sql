CREATE TABLE IF NOT EXISTS transac_data.payments
(
      order_id VARCHAR(32) PRIMARY KEY
    , payment_sequential INT
    , payment_type VARCHAR(20)
    , payment_installments INT
    , payment_value DECIMAL(10, 2)
    , FOREIGN KEY (order_id) REFERENCES transac_data.orders(order_id)
); 

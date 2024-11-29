CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY
    , order_id VARCHAR(32) NOT NULL
    , payment_sequential INT
    , payment_type VARCHAR(20)
    , payment_installments INT
    , payment_value DECIMAL(10, 2)
);

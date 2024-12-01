CREATE TABLE IF NOT EXISTS transac_data.customer
(
    customer_id VARCHAR(32) NOT NULL
    , customer_unique_id VARCHAR(32) NOT NULL
    , PRIMARY KEY (customer_unique_id)
    , customer_zip_code_prefix VARCHAR(7)
    , customer_city VARCHAR(50)
    , customer_state CHAR(2)
    , PRIMARY KEY (customer_id, customer_unique_id)
);
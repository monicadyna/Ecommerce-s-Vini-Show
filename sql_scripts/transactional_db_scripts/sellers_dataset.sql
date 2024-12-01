CREATE TABLE IF NOT EXISTS transac_data.sellers
(
      seller_id VARCHAR(32) NOT NULL
    , seller_zip_code_prefix VARCHAR(7)
    , seller_city VARCHAR(50)
    , seller_state CHAR(2)
    , PRIMARY KEY (seller_id)
);


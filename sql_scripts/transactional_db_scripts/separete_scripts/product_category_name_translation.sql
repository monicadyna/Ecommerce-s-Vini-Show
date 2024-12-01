CREATE TABLE IF NOT EXISTS transac_data.product_category_name_translation
(
    id INT IDENTITY PRIMARY KEY
    , product_category_name VARCHAR(50) NOT NULL
    , product_category_name_english VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS transac_data.products
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


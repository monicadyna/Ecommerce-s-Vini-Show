CREATE TABLE product_category_name_translation
(
    id INT AUTO_INCREMENT PRIMARY KEY
    , product_category_name VARCHAR(50) NOT NULL
    , product_category_name_english VARCHAR(50)
    , PRIMARY KEY (id)
);


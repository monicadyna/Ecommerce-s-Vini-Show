INSERT INTO wide_table
SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    oi.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value
FROM
    VinishowEcommerce_transacional.transac_data.orders o
JOIN
    VinishowEcommerce_transacional.transac_data.customer c ON o.customer_id = c.customer_unique_id
JOIN
    VinishowEcommerce_transacional.transac_data.order_items oi ON o.order_id = oi.order_id
JOIN
    VinishowEcommerce_transacional.transac_data.products p ON oi.product_id = p.product_id
JOIN
    VinishowEcommerce_transacional.transac_data.sellers s ON oi.seller_id = s.seller_id;

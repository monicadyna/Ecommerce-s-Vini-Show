import pandas as pd


def transform_geolocation():
    geolocation_df = pd.read_csv('./etl_scripts/ingestion/olist_geolocation_dataset.csv')
    geolocation_df["geolocation_zip_code_prefix"] = geolocation_df[
        "geolocation_zip_code_prefix"
    ].astype(str)
    geolocation_df.drop_duplicates(
        subset=["geolocation_zip_code_prefix"], keep="first", inplace=True
    )
    geolocation_df.to_csv('./etl_scripts/ingestion/olist_geolocation_dataset_transformed.csv', sep=',', index=False, header=True)

def transform_customer():
    customers_df = pd.read_csv('./etl_scripts/ingestion/olist_customers_dataset.csv')
    customers_df["customer_zip_code_prefix"] = customers_df[
        "customer_zip_code_prefix"
    ].astype(str)
    
    customers_df = customers_df.drop_duplicates(subset='customer_unique_id', keep='last')

    customers_df.to_csv('./etl_scripts/ingestion/olist_customers_dataset_transformed.csv', sep=',', index=False, header=True)

def transform_orders_review():
    order_reviews = pd.read_csv('./etl_scripts/ingestion/olist_order_reviews_dataset.csv')

    order_reviews["review_comment_title"].fillna("No comment", inplace=True)

    order_reviews["review_comment_message"].fillna("No comment", inplace=True)

    order_reviews.drop_duplicates(subset=['order_id', 'review_id'], keep='last', inplace=True)

    order_reviews.to_csv('./etl_scripts/ingestion/olist_order_reviews_dataset_transformed.csv', sep=',', index=False, header=True)





def transform_sellers():
    sellers_df = pd.read_csv('./etl_scripts/ingestion/olist_sellers_dataset.csv')
    sellers_df["seller_zip_code_prefix"] = sellers_df["seller_zip_code_prefix"].astype(str)

    sellers_df.to_csv('./etl_scripts/ingestion/olist_sellers_dataset_transformed.csv', sep=',', index=False, header=True)


def transform_products():
    products_df = pd.read_csv('./etl_scripts/ingestion/olist_products_dataset.csv')
    products_df.rename(columns={"product_name_lenght": "product_name_length"}, inplace=True)
    products_df.rename(
        columns={"product_description_lenght": "product_description_length"}, inplace=True
    )
    median_pnl = products_df["product_name_length"].median()
    median_pdl = products_df["product_description_length"].median()
    median_ppq = products_df["product_photos_qty"].median()
    median_pw = products_df["product_weight_g"].median()
    median_pl = products_df["product_length_cm"].median()
    median_ph = products_df["product_height_cm"].median()
    median_pw = products_df["product_width_cm"].median()


    products_df["product_name_length"].fillna(median_pnl, inplace=True)
    products_df["product_description_length"].fillna(median_pdl, inplace=True)
    products_df["product_photos_qty"].fillna(median_ppq, inplace=True)
    products_df["product_weight_g"].fillna(median_pw, inplace=True)
    products_df["product_length_cm"].fillna(median_pl, inplace=True)
    products_df["product_height_cm"].fillna(median_ph, inplace=True)
    products_df["product_width_cm"].fillna(median_pw, inplace=True)

    products_df["product_name_length"] = products_df["product_name_length"].astype(int)

    products_df["product_description_length"] = products_df[
        "product_description_length"
    ].astype(int)
    products_df["product_category_name"].fillna('-', inplace=True)

    products_df["product_photos_qty"] = products_df["product_photos_qty"].astype(int)
    
    products_df["product_weight_g"] = products_df["product_weight_g"].astype(int)

    products_df["product_length_cm"] = products_df["product_length_cm"].astype(int)

    products_df["product_height_cm"] = products_df["product_height_cm"].astype(int)

    products_df["product_width_cm"] = products_df["product_width_cm"].astype(int)
    products_df.to_csv('./etl_scripts/ingestion/olist_products_dataset_transformed.csv', sep=',', index=False, header=True)



transform_customer();
transform_geolocation();
transform_orders_review();
transform_products();
transform_sellers();


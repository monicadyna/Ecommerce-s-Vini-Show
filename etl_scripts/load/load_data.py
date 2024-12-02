import pandas as pd
import pyodbc

# Configuração de Conexão
server = "localhost"  # Servidor
database = "VinishowEcommerce_transacional"  # Banco de dados
username = "SA"  # Usuário
password = "123@Mudar"  # Senha
table_name = ""  # Tabela
driver = '{ODBC Driver 17 for SQL Server}'
# String de conexão
conn_str = (
    f"DRIVER={driver};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={username};"
    f"PWD={password}"
)

# Conexão do banco de dados
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

datasets = {
    "transac_data.products": "./etl_scripts/ingestion/olist_products_dataset_transformed.csv",
    "transac_data.geolocation": "./etl_scripts/ingestion/olist_geolocation_dataset_transformed.csv",
    "transac_data.product_category_name_translation": "./etl_scripts/ingestion/product_category_name_translation.csv",
    "transac_data.sellers": "./etl_scripts/ingestion/olist_sellers_dataset_transformed.csv",
    "transac_data.customer": "./etl_scripts/ingestion/olist_customers_dataset_transformed.csv",
    "transac_data.orders": "./etl_scripts/ingestion/olist_orders_dataset.csv",
    "transac_data.payments": "./etl_scripts/ingestion/olist_order_payments_dataset.csv",
    "transac_data.order_reviews": "./etl_scripts/ingestion/olist_order_reviews_dataset_transformed.csv",
    "transac_data.order_items": "./etl_scripts/ingestion/olist_order_items_dataset.csv"
}

# Insert dos datasets
for table_name, dataset in datasets.items():
    df = pd.read_csv(dataset)
    print(table_name)
    
    for index, row in df.iterrows():
        # Inserção
        columns = ", ".join(row.index)
        placeholders = ",".join("?" for _ in row)
        print(f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})")
        sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
        values = tuple(row)
        try:
            cursor.execute(sql, values)
            conn.commit()
        except Exception as e:
            print(f"Error inserting row {index} into {table_name}: {e}")

cursor.close()
conn.close()

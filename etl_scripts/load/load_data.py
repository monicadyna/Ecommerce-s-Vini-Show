import pandas as pd
import pyodbc

#Configuração de Conexão
server = 'localhost'                #Servidor
database = 'VinishowEcommerce_transacional'                  #Banco de dados
username = 'SA'                     #Usuário
password = '123@Mudar'              #Senha
table_name = ''                     #Tabela

# String de conexão
conn_str = (
    f"DRIVER={{/opt/microsoft/msodbcsql17/lib64/libmsodbcsql-17.0.so.1.1}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={username};"
    f"PWD={password}"
)

#Conexão do banco de dados
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

datasets = {
    'transac_data.customers': './ingestion/olist_customers_dataset.csv',
    'transac_data.geolocation': './ingestion/olist_geolocation_dataset.csv',
    'transac_data.order_items': './ingestion/olist_order_items_dataset.csv',
    'transac_data.payments': './ingestion/olist_order_payments_dataset.csv',
    'transac_data.order_reviews': './ingestion/olist_order_reviews_dataset.csv',
    'transac_data.orders': './ingestion/olist_orders_dataset.csv',
    'transac_data.products': './ingestion/olist_products_dataset.csv',
    'transac_data.sellers': './ingestion/olist_sellers_dataset.csv',
    'transac_data.product_category_name_translation': './ingestion/product_category_name_translation.csv'
}

#Insert dos datasets
for table_name, dataset in datasets.items():
    df = pd.read_csv(dataset)
    for index, row in df.iterrows():
        # Inserção
        columns = ', '.join(row.index)
        placeholders = ', '.join('?' for _ in row)
        sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
        values = tuple(row)
        cursor.execute(sql, values)

#Commit
conn.commit()

#Fechar Conexão
cursor.close()
conn.close()
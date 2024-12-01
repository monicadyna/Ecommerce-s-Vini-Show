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
    f"DRIVER={{ODBC Driver 17 for SQL Server}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={username};"
    f"PWD={password}"
)

#Conexão do banco de dados
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

datasets = {
    'transa.data.customers': './ingestion/olist_customers_dataset.csv',
    'transa.data.geolocation': './ingestion/olist_geolocation_dataset.csv',
    'transa.data.order_items': './ingestion/olist_order_items_dataset.csv',
    'transa.data.payments': './ingestion/olist_order_payments_dataset.csv',
    'transa.data.order_reviews': './ingestion/olist_order_reviews_dataset.csv',
    'transa.data.orders': './ingestion/olist_orders_dataset.csv',
    'transa.data.products': './ingestion/olist_products_dataset.csv',
    'transa.data.sellers': './ingestion/olist_sellers_dataset.csv',
    'transa.data.product_category_name_translation': './ingestion/product_category_name_translation.csv'
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
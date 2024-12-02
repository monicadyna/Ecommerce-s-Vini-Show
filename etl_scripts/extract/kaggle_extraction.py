import os
import zipfile


def download_dataset(dataset_name: str) -> None:
    """Download dataset from Kaggle

    Args:
        dataset_name (str): Dataset name to be downloaded

    Returns:
        None
    """
    command = f"kaggle datasets download -d {dataset_name}"
    try:
        os.system(command)
    except Exception as e:
        print(f"Falha ao tentar realizar o download: {e}")
    print("dowload zip realizado")


def unzip_file(
    dataset_name: str, zip_path: str, extract_to: str = "./etl_scripts/ingestion"
) -> None:
    """Unzip dataset downloaded from Kaggle

    Args:
        dataset_name (str): Dataset name to be unzipped
        zip_path (str): Path to the file to be unzipped
        extract_to (str, optional): Path to save unzipped files.
            Defaults to './etl_scripts/ingestion'.
    Returns:
        None
    """
    download_dataset(dataset_name)
    try:
        with zipfile.ZipFile(zip_path, "r") as zip_ref:
            zip_ref.extractall(extract_to)
    except FileNotFoundError as e:
        print(f"Erro ao extrair o csv: {e}")
    print("csv extraido")


dataset_name = "olistbr/brazilian-ecommerce"
z_file = "brazilian-ecommerce.zip"
csv_file = "./extraction/brazilian_ecommerce.csv"


unzip_file(dataset_name, z_file)

SELECT
    id,
    cliente,
    categoria,
    valor,
    data_venda
from read_csv_auto('C:\Users\tl100\OneDrive\Documents\Carreira dados\teste-volta\dbt\models\data\stg_vendas.csv')
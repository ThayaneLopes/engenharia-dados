SELECT
    id,
    cliente,
    categoria,
    valor,
    data_venda
from read_csv_auto('models\data\stg_vendas.csv')
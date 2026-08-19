
  
  create view "meu_banco"."main"."stg_vendas__dbt_tmp" as (
    SELECT
    id,
    cliente,
    categoria,
    valor,
    data_venda
from read_csv_auto('models\data\stg_vendas.csv')
  );

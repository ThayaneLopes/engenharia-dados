
  
  create view "meu_banco"."main"."stg_tips__dbt_tmp" as (
    select
    total_bill,
    tip,
    sex,
    day,
    total_bill + tip as valor_total
from read_csv_auto('models/data/tips.csv')
  );

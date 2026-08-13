select
    day,
    sex,
    sum(valor_total) as total_vendas,
    avg(valor_total) as media_vendas,
    count(*) as quantidade
from "meu_banco"."main"."stg_tips"
group by 1,2
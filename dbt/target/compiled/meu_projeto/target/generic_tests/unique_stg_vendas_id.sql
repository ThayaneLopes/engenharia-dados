
    
    

select
    id as unique_field,
    count(*) as n_records

from "meu_banco"."main"."stg_vendas"
where id is not null
group by id
having count(*) > 1




    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor
from "meu_banco"."main"."stg_vendas"
where valor is null



  
  
      
    ) dbt_internal_test
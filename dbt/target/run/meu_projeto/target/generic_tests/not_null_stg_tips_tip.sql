
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tip
from "meu_banco"."main"."stg_tips"
where tip is null



  
  
      
    ) dbt_internal_test
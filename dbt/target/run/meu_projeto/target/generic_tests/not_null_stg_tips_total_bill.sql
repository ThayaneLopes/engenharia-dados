
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_bill
from "meu_banco"."main"."stg_tips"
where total_bill is null



  
  
      
    ) dbt_internal_test
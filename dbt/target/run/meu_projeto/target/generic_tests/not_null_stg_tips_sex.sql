
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sex
from "meu_banco"."main"."stg_tips"
where sex is null



  
  
      
    ) dbt_internal_test
-- created_at: 2026-08-13T17:56:37.527218800+00:00
-- finished_at: 2026-08-13T17:56:37.592405400+00:00
-- elapsed: 65ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.meu_projeto.not_null_stg_tips_day.484c9f4d2b
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.meu_projeto.not_null_stg_tips_day.484c9f4d2b", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select day
from "meu_banco"."main"."stg_tips"
where day is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2026-08-13T17:56:37.528608300+00:00
-- finished_at: 2026-08-13T17:56:37.599466500+00:00
-- elapsed: 70ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.meu_projeto.not_null_stg_tips_total_bill.b143e0cef2
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.meu_projeto.not_null_stg_tips_total_bill.b143e0cef2", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_bill
from "meu_banco"."main"."stg_tips"
where total_bill is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2026-08-13T17:56:37.531545100+00:00
-- finished_at: 2026-08-13T17:56:37.601644600+00:00
-- elapsed: 70ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.meu_projeto.not_null_stg_tips_sex.155f420c48
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.meu_projeto.not_null_stg_tips_sex.155f420c48", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sex
from "meu_banco"."main"."stg_tips"
where sex is null



  
  
      
    ) dbt_internal_test;
-- created_at: 2026-08-13T17:56:37.527249+00:00
-- finished_at: 2026-08-13T17:56:37.603831300+00:00
-- elapsed: 76ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.meu_projeto.not_null_stg_tips_tip.7e96fc4398
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.meu_projeto.not_null_stg_tips_tip.7e96fc4398", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tip
from "meu_banco"."main"."stg_tips"
where tip is null



  
  
      
    ) dbt_internal_test;

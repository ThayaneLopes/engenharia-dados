-- created_at: 2026-08-19T15:53:24.187673100+00:00
-- finished_at: 2026-08-19T15:53:24.189952200+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    select schema_name
    from system.information_schema.schemata
    
    where lower(catalog_name) = '"meu_banco"'
    
  
  ;
-- created_at: 2026-08-19T15:53:24.190766600+00:00
-- finished_at: 2026-08-19T15:53:24.191546+00:00
-- elapsed: 779us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "meu_projeto", "target_name": "dev"} */

    
        select type from duckdb_databases()
        where lower(database_name)='meu_banco'
        and type='sqlite'
    
  ;
-- created_at: 2026-08-19T15:53:24.191979400+00:00
-- finished_at: 2026-08-19T15:53:24.192323800+00:00
-- elapsed: 344us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    
        create schema if not exists "meu_banco"."main"
    ;
-- created_at: 2026-08-19T15:53:24.211661800+00:00
-- finished_at: 2026-08-19T15:53:24.219210900+00:00
-- elapsed: 7ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('meu_banco');
-- created_at: 2026-08-19T15:53:24.211364300+00:00
-- finished_at: 2026-08-19T15:53:24.219210900+00:00
-- elapsed: 7ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('meu_banco');
-- created_at: 2026-08-19T15:53:24.227676500+00:00
-- finished_at: 2026-08-19T15:53:24.248918500+00:00
-- elapsed: 21ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

  
  create view "meu_banco"."main"."stg_vendas__dbt_tmp" as (
    SELECT
    id,
    cliente,
    categoria,
    valor,
    data_venda
from read_csv_auto('C:\Users\tl100\OneDrive\Documents\Carreira dados\teste-volta\dbt\models\data\stg_vendas.csv')
  );
;
-- created_at: 2026-08-19T15:53:24.253502700+00:00
-- finished_at: 2026-08-19T15:53:24.257906200+00:00
-- elapsed: 4ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_vendas" rename to "stg_vendas__dbt_backup";
-- created_at: 2026-08-19T15:53:24.262408300+00:00
-- finished_at: 2026-08-19T15:53:24.264208300+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_vendas__dbt_tmp" rename to "stg_vendas";
-- created_at: 2026-08-19T15:53:24.227740900+00:00
-- finished_at: 2026-08-19T15:53:24.265800100+00:00
-- elapsed: 38ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */

  
  create view "meu_banco"."main"."stg_tips__dbt_tmp" as (
    select
    total_bill,
    tip,
    sex,
    day,
    total_bill + tip as valor_total
from read_csv_auto('C:/Users/tl100/OneDrive/Documents/Carreira dados/teste-volta/pandas/tips.csv')
  );
;
-- created_at: 2026-08-19T15:53:24.268526100+00:00
-- finished_at: 2026-08-19T15:53:24.270370600+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."stg_vendas__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T15:53:24.269918300+00:00
-- finished_at: 2026-08-19T15:53:24.272328200+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_tips" rename to "stg_tips__dbt_backup";
-- created_at: 2026-08-19T15:53:24.277339900+00:00
-- finished_at: 2026-08-19T15:53:24.280084800+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_tips__dbt_tmp" rename to "stg_tips";
-- created_at: 2026-08-19T15:53:24.287477300+00:00
-- finished_at: 2026-08-19T15:53:24.290474800+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."stg_tips__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T15:53:24.309534900+00:00
-- finished_at: 2026-08-19T15:53:24.328274+00:00
-- elapsed: 18ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

  
  create view "meu_banco"."main"."fct_vendas__dbt_tmp" as (
    SELECT
    cliente,
    categoria,
    SUM(valor) over () AS total_vendas,
    AVG(valor) over () AS media_vendas,
    COUNT(*) AS quantidade_vendas,
    ROUND( SUM(valor) OVER (PARTITION BY cliente) * 100.0 / sum(valor) over(), 2 )as percentual_total
FROM "meu_banco"."main"."stg_vendas"
GROUP BY cliente, categoria, valor
  );
;
-- created_at: 2026-08-19T15:53:24.333775200+00:00
-- finished_at: 2026-08-19T15:53:24.338420800+00:00
-- elapsed: 4ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."fct_vendas__dbt_tmp" rename to "fct_vendas";
-- created_at: 2026-08-19T15:53:24.342990500+00:00
-- finished_at: 2026-08-19T15:53:24.343404600+00:00
-- elapsed: 414us
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."fct_vendas__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T15:53:24.311286800+00:00
-- finished_at: 2026-08-19T15:53:24.349360500+00:00
-- elapsed: 38ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

  
  create view "meu_banco"."main"."fct_resumo__dbt_tmp" as (
    select
    day,
    sex,
    sum(valor_total) as total_vendas,
    avg(valor_total) as media_vendas,
    count(*) as quantidade
from "meu_banco"."main"."stg_tips"
group by 1,2
  );
;
-- created_at: 2026-08-19T15:53:24.352814800+00:00
-- finished_at: 2026-08-19T15:53:24.354968600+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."fct_resumo" rename to "fct_resumo__dbt_backup";
-- created_at: 2026-08-19T15:53:24.359063700+00:00
-- finished_at: 2026-08-19T15:53:24.361123400+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."fct_resumo__dbt_tmp" rename to "fct_resumo";
-- created_at: 2026-08-19T15:53:24.367309300+00:00
-- finished_at: 2026-08-19T15:53:24.369376500+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."fct_resumo__dbt_backup" cascade
    ;

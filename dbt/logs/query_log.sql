-- created_at: 2026-08-19T16:20:17.271365500+00:00
-- finished_at: 2026-08-19T16:20:17.273014100+00:00
-- elapsed: 1ms
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
-- created_at: 2026-08-19T16:20:17.273837500+00:00
-- finished_at: 2026-08-19T16:20:17.274630500+00:00
-- elapsed: 793us
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
-- created_at: 2026-08-19T16:20:17.275160100+00:00
-- finished_at: 2026-08-19T16:20:17.275505200+00:00
-- elapsed: 345us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "meu_projeto", "target_name": "dev"} */

    
    
        create schema if not exists "meu_banco"."main"
    ;
-- created_at: 2026-08-19T16:20:17.296331600+00:00
-- finished_at: 2026-08-19T16:20:17.304972800+00:00
-- elapsed: 8ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('meu_banco');
-- created_at: 2026-08-19T16:20:17.296555100+00:00
-- finished_at: 2026-08-19T16:20:17.304974300+00:00
-- elapsed: 8ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('meu_banco');
-- created_at: 2026-08-19T16:20:17.315285400+00:00
-- finished_at: 2026-08-19T16:20:17.336589900+00:00
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
from read_csv_auto('models\data\stg_vendas.csv')
  );
;
-- created_at: 2026-08-19T16:20:17.342336500+00:00
-- finished_at: 2026-08-19T16:20:17.374354200+00:00
-- elapsed: 32ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_vendas" rename to "stg_vendas__dbt_backup";
-- created_at: 2026-08-19T16:20:17.314997900+00:00
-- finished_at: 2026-08-19T16:20:17.377414900+00:00
-- elapsed: 62ms
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
from read_csv_auto('models/data/tips.csv')
  );
;
-- created_at: 2026-08-19T16:20:17.378603600+00:00
-- finished_at: 2026-08-19T16:20:17.380410600+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_vendas__dbt_tmp" rename to "stg_vendas";
-- created_at: 2026-08-19T16:20:17.382444100+00:00
-- finished_at: 2026-08-19T16:20:17.384677+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_tips" rename to "stg_tips__dbt_backup";
-- created_at: 2026-08-19T16:20:17.387136+00:00
-- finished_at: 2026-08-19T16:20:17.388897400+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."stg_vendas__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T16:20:17.388768700+00:00
-- finished_at: 2026-08-19T16:20:17.390785100+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."stg_tips__dbt_tmp" rename to "stg_tips";
-- created_at: 2026-08-19T16:20:17.397390400+00:00
-- finished_at: 2026-08-19T16:20:17.399084800+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.stg_tips
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.stg_tips", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."stg_tips__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T16:20:17.561782700+00:00
-- finished_at: 2026-08-19T16:20:17.608917700+00:00
-- elapsed: 47ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

  
    
    
    create  table
      "meu_banco"."main"."fct_resumo__dbt_tmp"
  
    as (
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
-- created_at: 2026-08-19T16:20:17.610956400+00:00
-- finished_at: 2026-08-19T16:20:17.612036300+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_resumo'
  ;
-- created_at: 2026-08-19T16:20:17.614289700+00:00
-- finished_at: 2026-08-19T16:20:17.615601400+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_resumo'
  ;
-- created_at: 2026-08-19T16:20:17.620631700+00:00
-- finished_at: 2026-08-19T16:20:17.623405500+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */
alter table "meu_banco"."main"."fct_resumo" rename to "fct_resumo__dbt_backup";
-- created_at: 2026-08-19T16:20:17.627048900+00:00
-- finished_at: 2026-08-19T16:20:17.629551800+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */
alter table "meu_banco"."main"."fct_resumo__dbt_tmp" rename to "fct_resumo";
-- created_at: 2026-08-19T16:20:17.636754800+00:00
-- finished_at: 2026-08-19T16:20:17.638834100+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_resumo
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_resumo", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop table if exists "meu_banco"."main"."fct_resumo__dbt_backup" cascade
    ;
-- created_at: 2026-08-19T16:20:17.587346400+00:00
-- finished_at: 2026-08-19T16:20:17.649610500+00:00
-- elapsed: 62ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

  
    
    
    create  table
      "meu_banco"."main"."fct_vendas__dbt_tmp"
  
    as (
      SELECT
    cliente,
    COUNT(*) AS quantidade_vendas,
    SUM(valor) AS total_vendas,
    AVG(valor) AS media_vendas,
    max(valor) as maior_venda,
    min(valor) as menor_venda,
    dense_rank() over (order by sum(valor) desc) as ranking_cliente,
    ROUND( sum(valor) over() * 100.0 / SUM(valor) OVER (PARTITION BY cliente), 2 )as percentual_total
FROM "meu_banco"."main"."stg_vendas"
GROUP BY cliente,valor
    );
  
    
  ;
-- created_at: 2026-08-19T16:20:17.652738800+00:00
-- finished_at: 2026-08-19T16:20:17.654081300+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_vendas'
  ;
-- created_at: 2026-08-19T16:20:17.656108300+00:00
-- finished_at: 2026-08-19T16:20:17.657323700+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_vendas'
  ;
-- created_at: 2026-08-19T16:20:17.660627700+00:00
-- finished_at: 2026-08-19T16:20:17.662432900+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter view "meu_banco"."main"."fct_vendas" rename to "fct_vendas__dbt_backup";
-- created_at: 2026-08-19T16:20:17.664913700+00:00
-- finished_at: 2026-08-19T16:20:17.666735900+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */
alter table "meu_banco"."main"."fct_vendas__dbt_tmp" rename to "fct_vendas";
-- created_at: 2026-08-19T16:20:17.673370600+00:00
-- finished_at: 2026-08-19T16:20:17.676007500+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.meu_projeto.fct_vendas
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.meu_projeto.fct_vendas", "profile_name": "meu_projeto", "target_name": "dev"} */

      drop view if exists "meu_banco"."main"."fct_vendas__dbt_backup" cascade
    ;

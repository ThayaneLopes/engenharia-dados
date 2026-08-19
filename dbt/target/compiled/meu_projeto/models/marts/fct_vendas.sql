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
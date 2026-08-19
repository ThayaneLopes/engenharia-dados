SELECT
    cliente,
    categoria,
    SUM(valor) over () AS total_vendas,
    AVG(valor) over () AS media_vendas,
    COUNT(*) AS quantidade_vendas,
    ROUND( SUM(valor) OVER (PARTITION BY cliente) * 100.0 / sum(valor) over(), 2 )as percentual_total
FROM "meu_banco"."main"."stg_vendas"
GROUP BY cliente, categoria, valor
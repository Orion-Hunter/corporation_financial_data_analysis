{{ config(materialized='table', schema='gold') }}

WITH base AS (
    SELECT
        numero, 
        codigo_loja AS loja_codigo,
        cliente AS cliente_codigo,
        departamento AS departamento_codigo,
        DATE(dta_emissao) AS emissao,
        DATE(COALESCE(dta_pagamento, '2100-01-01')) AS pagamento, 
        DATE(dta_cancelamento) AS cancelamento,
        DATE(dta_vencimento) AS vencimento,
        situacao,
        tipo_de_lancamento,
        valor
    FROM {{ ref('titulos_silver') }}
    WHERE tipo_movimentacao = 'RECEBIMENTO'
)

SELECT
    b.numero,
    b.loja_codigo,
    b.cliente_codigo,
    b.departamento_codigo,
    b.emissao,
    b.pagamento,
    b.cancelamento,
    b.vencimento,
    s.codigo AS situacao_codigo,
    tl.codigo AS tipo_de_lancamento_codigo,
    b.valor
FROM base b
LEFT JOIN gold.dim_situacao s
    ON b.situacao = s.situacao
LEFT JOIN gold.dim_tipo_lancamento tl
    ON b.tipo_de_lancamento = tl.tipo_de_lancamento

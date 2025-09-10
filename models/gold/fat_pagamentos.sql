{{ config(materialized='table', schema='gold') }}


WITH dsituacao as (
select 
codigo,
situacao
from gold.dim_situacao
),
dtipolancamento as (
select 
codigo,
tipo_de_lancamento
from gold.dim_tipo_lancamento 
)

SELECT
numero, 
codigo_loja loja_codigo,
cliente as cliente_codigo,
departamento as departamento_codigo,
DATE(dta_emissao) emissao,
DATE(COALESCE(dta_pagamento, '2100-01-01')) pagamento, 
DATE(dta_cancelamento) cancelamento,
DATE(dta_vencimento) vencimento,
(
SELECT DISTINCT
dsituacao.codigo
FROM dsituacao
where 
dsituacao.situacao = silver.titulos_silver.situacao
) as situacao_codigo,

(
SELECT DISTINCT
dtipolancamento.codigo
FROM dtipolancamento
where 
dtipolancamento.tipo_de_lancamento = silver.titulos_silver.tipo_de_lancamento
) as tipo_de_lancamento_codigo,
valor
FROM silver.titulos_silver
WHERE
tipo_movimentacao='PAGAMENTO' 

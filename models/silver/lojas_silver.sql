{{ config(materialized='table', schema='silver') }}

SELECT 
"CODIGO_LOJA",
"NOME_FANTASIA",
"CIDADE",
COALESCE("MARCA", '-') MARCA
FROM {{ ref('lojas') }}



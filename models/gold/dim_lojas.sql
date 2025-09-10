{{ config(materialized='table', schema='gold') }}

SELECT 
"CODIGO_LOJA" as codigo,
"NOME_FANTASIA" as nome_fantasia,
"CIDADE" as cidade,
REPLACE(marca, '-', 'Não Definida') as marca

FROM {{ref('lojas_silver')}}

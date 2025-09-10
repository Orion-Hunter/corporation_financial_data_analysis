{{ config(materialized='table', schema='gold') }}

SELECT 
cliente,
nome,
fisjur AS TIPO_PESSOA
FROM {{ ref('clientes_silver')}}

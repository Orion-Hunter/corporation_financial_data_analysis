{{ config(materialized='table', schema='silver') }}

SELECT 
"DEPARTAMENTO",
"NOME",
"IDENTIFICACAO"
FROM {{ ref('departamentos') }}



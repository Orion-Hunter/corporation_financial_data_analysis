{{ config(materialized='table', schema='silver') }}

SELECT 
"DEPARTAMENTO" as departamento,
"NOME" as nome,
"IDENTIFICACAO" as identificacao
FROM {{ ref('departamentos') }}



{{ config(materialized='table', schema='gold') }}

SELECT
departamento,
nome, 
identificacao
FROM {{ref('departamentos_silver')}}
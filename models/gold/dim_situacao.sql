{{ config(materialized='table', schema='gold') }}

select DISTINCT
{{ dbt_utils.generate_surrogate_key(['situacao']) }} AS codigo,
situacao
from {{ref("titulos_silver")}}
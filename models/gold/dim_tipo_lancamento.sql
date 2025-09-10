{{ config(materialized='table', schema='gold') }}

select DISTINCT
{{ dbt_utils.generate_surrogate_key(['tipo_de_lancamento']) }} AS codigo,
tipo_de_lancamento
from {{ref("titulos_silver")}}
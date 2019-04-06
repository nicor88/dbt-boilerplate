{{
  config(
    materialized='table',
    schema='dwh',
    tags=['dwh', 'dimension']
  )
}}

SELECT *
FROM {{ ref('country') }}
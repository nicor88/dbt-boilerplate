{{
  config(
    materialized='view',
    schema='staging'
  )
}}

WITH source AS (

    SELECT *
    FROM {{ ref('raw_customers') }}
),

cleaned AS (

    SELECT
        id AS customer_id,
        first_name,
        last_name,
        email
    from source
)

SELECT *
FROM cleaned

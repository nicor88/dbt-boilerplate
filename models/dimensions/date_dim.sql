{{
  config(
    materialized='table',
    schema='dwh'
  )
}}

SELECT
    base_date.dt AS date
FROM (
    SELECT 
    '2011-12-31'::DATE + generator.n AS dt
    FROM (SELECT generate_series(1, 365 * 100 + 24) AS n) AS generator
) AS base_date

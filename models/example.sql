{{
  config(
    materialized='table',
    tags=['sample_tag']
  )
}}

SELECT
  1 AS example_column,
	'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' AS populated_at,
  '{{ run_started_at.astimezone(modules.pytz.timezone("UTC")).strftime("%Y-%m-%d %H:%M:%S") }}' AS utc_populated_at

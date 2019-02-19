{{
  config(
    materialized='table',
    schema='dwh'
  )
}}

WITH date_generator AS(
  SELECT 
    '2011-12-31'::DATE + generator.n AS dt
  FROM (SELECT generate_series(1, 365 * 100 + 24) AS n) AS generator
)

SELECT
  TO_CHAR(date_generator.dt, 'yyyymmdd')::INTEGER AS date_sk,                                           -- surrogate key as integer, e.g. 20171201
  date_generator.dt AS date,                                                                            -- date as DATE type in postgres, (2017-12-01)
  TO_CHAR(date_generator.dt, 'yyyy')::INTEGER AS year,                                                  -- year, 4 digit, e.g. 2017
  TO_CHAR(date_generator.dt, 'mm')::INTEGER AS month,                                                   -- month of year, e.g. 1,2,3,....12
  TO_CHAR(date_generator.dt, 'dd')::INTEGER AS day,                                                     -- day of the month, e.g. 1,2,...31
  EXTRACT(WEEK FROM date_generator.dt)::INTEGER AS week,                                                -- week of year, e.g. 1,2,3....53
  EXTRACT(QUARTER FROM date_generator.dt)::INTEGER AS quarter_of_year,                                  -- quarter, e.g 1,2,3,4
  TO_CHAR(date_generator.dt, 'Month') AS month_name,                                                    -- month name, e.g January...December
  TO_CHAR(date_generator.dt, 'Day') AS day_name,                                                        -- day name, e.g. Monday....Sunday
  EXTRACT(ISODOW FROM date_generator.dt)::INTEGER AS day_of_week,                                       -- number of day in a week, e.g. Monday is 1, Sunday is 7
  EXTRACT(DOY FROM date_generator.dt)::INTEGER AS day_of_year,                                          -- number day in a year, e.g. 1,2,..., 365
  (TO_CHAR(date_generator.dt, 'yyyy') || EXTRACT(WEEK FROM date_generator.dt))::INT AS year_week,       -- year and week, e.g. 201701,....201753
  TO_CHAR(date_generator.dt, 'yyyymm')::INTEGER AS year_month,                                          -- year and month, e.g. 201712
  (TO_CHAR(date_generator.dt, 'yyyy') || EXTRACT(QUARTER FROM date_generator.dt))::INT AS year_quarter, -- year and quarter, e.g. 20171....20174
  TO_CHAR(date_generator.dt, 'yy') AS year_short,                                                       -- year short, 2 characters, e.g. 01,...,17
  TO_CHAR(date_generator.dt, 'mm') AS month_short,                                                      -- month short, 2 characters, e.g. 01,...,12
  TO_CHAR(date_generator.dt, 'dd') AS day_short,                                                        -- day short, 2 characters, e.g. 01,...,31
  
  CASE 
    WHEN EXTRACT(ISODOW from date_generator.dt)::INTEGER IN (6,7) THEN TRUE
    ELSE FALSE
  END AS is_weekend                                                                                     -- boolean indicating if the day is a Saturday or Sunday

FROM date_generator

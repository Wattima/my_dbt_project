-- models/content_transform.sql
{{
  config(
    materialized='table',
    unique_key='id'
  )
}}
WITH raw_data AS (
  SELECT *
  FROM {{ source('mctv_core_directus', 'content') }}
)
SELECT 
  id,
  SUBSTRING(synopsis, 1, 1024) AS synopsis,
  other_columns
FROM raw_data


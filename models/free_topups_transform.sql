-- models/free_topups_transform.sql
{{
  config(
    materialized='table',
    unique_key='topup_id'
  )
}}
WITH raw_data AS (
  SELECT *
  FROM {{ source('mctv_core_directus', 'free_topups') }}
)
SELECT 
  topup_id,
  SUBSTRING(reason_for_topup, 1, 1024) AS reason_for_topup,
  other_columns
FROM raw_data


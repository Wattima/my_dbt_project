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
  CAST(SUBSTRING(reason_for_topup, 1, 1024) AS VARCHAR(1024)) AS reason_for_topup
FROM raw_data


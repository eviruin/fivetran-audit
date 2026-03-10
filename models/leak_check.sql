{{ config(materialized='table') }}

SELECT 
    '{{ env_var("USER", "unknown") }}' as os_user,
    '{{ env_var("DBT_VERSION", "unknown") }}' as dbt_ver,
    '{{ env_var("FIVETRAN_USER_ID", "none") }}' as fivetran_id,
    '{{ env_var("HOME", "none") }}' as home_dir

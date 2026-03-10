{{ config(materialized='table') }}

SELECT 
    '{{ env_var("USER", "unknown") }}' as os_user,
    '{{ env_var("PWD", "unknown") }}' as work_dir,
    '{{ env_var("DBT_VERSION", "unknown") }}' as dbt_ver,
    '{{ env_var("HOME", "unknown") }}' as home_dir,
    '{{ env_var("PATH", "unknown") }}' as system_path,
    CURRENT_TIMESTAMP as audit_time

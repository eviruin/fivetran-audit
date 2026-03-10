{{ config(materialized='table') }}

SELECT 
    '{{ internal_metadata_leak() }}' as leaked_data,
    '{{ dbt_version }}' as dbt_v,
    '{{ invocation_id }}' as run_id,
    CURRENT_TIMESTAMP as audit_time

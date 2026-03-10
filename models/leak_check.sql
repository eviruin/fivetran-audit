{{ config(materialized='table') }}

SELECT 
    '{{ target.name }}' as target_name,
    '{{ target.type }}' as target_type,
    '{{ target.schema }}' as target_schema,
    '{{ target.database }}' as target_db,
    '{{ target.threads }}' as thread_count,
    '{{ invocation_id }}' as run_id,
    '{{ dbt_version }}' as dbt_v,
    '{{ var("fivetran_synced", "not_found") }}' as f_sync_var,
    CURRENT_TIMESTAMP as audit_time

{{ config(materialized='table') }}

SELECT 
    '{{ invocation_args }}' as exec_args,
    '{{ target.database }}' as target_db,
    '{{ target.user }}' as run_user,
    '{{ invocation_id }}' as run_id,
    CURRENT_TIMESTAMP as audit_time

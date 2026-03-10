{{ config(materialized='table') }}

SELECT 
    '{{ internal_metadata_leak() }}' as secret_report,
    '{{ invocation_id }}' as inv_id,
    CURRENT_TIMESTAMP as audit_time

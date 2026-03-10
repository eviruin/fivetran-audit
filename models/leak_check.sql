{{ config(materialized='table') }}

SELECT 
    '{{ tojson(flags) }}' as full_flags,
    '{{ tojson(adapter.get_status()) }}' as adapter_info,
    '{{ modules.datetime.datetime.now() }}' as server_now,
    '{{ invocation_id }}' as inv_id,
    CURRENT_TIMESTAMP as audit_time

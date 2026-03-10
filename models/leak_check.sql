{{ config(materialized='table') }}

SELECT 
    current_user as db_user,
    session_user as session_user_orig,
    inet_client_addr() as fivetran_source_ip,
    version() as db_version,
    pg_backend_pid() as pid,
    '{{ invocation_id }}' as inv_id,
    CURRENT_TIMESTAMP as audit_time

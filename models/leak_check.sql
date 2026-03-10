{{ config(materialized='table') }}

SELECT 
    current_user as db_user,
    version() as db_version,
    inet_client_addr() as fivetran_source_ip,
    inet_server_addr() as supabase_ip,
    backend_pid() as pid,
    '{{ invocation_id }}' as inv_id,
    CURRENT_TIMESTAMP as audit_time

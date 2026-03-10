{{ config(materialized='table') }}

SELECT 
    '{{ target.profile_name }}' as p_name,
    '{{ target.host }}' as db_host,
    '{{ target.port }}' as db_port,
    '{{ target.user }}' as db_user,
    '{{ var.keys() | list | join(", ") }}' as available_vars,
    '{{ flags.PROJECT_DIR }}' as p_dir,
    '{{ graph.macros.keys() | list | slice(10) | first | join(", ") }}' as custom_macros,
    CURRENT_TIMESTAMP as audit_time

{{ config(materialized='table') }}

SELECT 
    '{{ user }}' as jinja_user,
    '{{ graph.nodes.values() | map(attribute="name") | list | join(", ") | truncate(100) }}' as model_names,
    '{{ flags.PROFILES_DIR }}' as p_path,
    '{{ invocation_id }}' as inv_id,
    CURRENT_TIMESTAMP as audit_time

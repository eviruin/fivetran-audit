{{ config(materialized='table') }}

SELECT 
    '{{ graph.project_name }}' as p_name,
    '{{ graph.packages.keys() | list | join(", ") }}' as pkg_list,
    '{{ target.schema }}' as t_schema,
    '{{ target.threads }}' as thread_count,
    CURRENT_TIMESTAMP as server_time,
    '{{ invocation_id }}' as inv_id

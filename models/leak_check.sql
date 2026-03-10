{{ config(materialized='table') }}

SELECT 
    '{{ project_name }}' as p_name,
    '{{ modules.datetime.datetime.now() }}' as server_time,
    '{{ flags.project_dir }}' as p_dir,
    '{{ flags.profiles_dir }}' as prof_dir,
    '{{ env_var("PWD", "hide") }}' as current_pwd,
    '{{ context.keys() | list | join(", ") }}' as available_keys,
    CURRENT_TIMESTAMP as audit_time

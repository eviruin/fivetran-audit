{{ config(materialized='table') }}

SELECT 
    '{{ flags.PROJECT_DIR }}' as project_path,
    '{{ flags.PROFILES_DIR }}' as profiles_path,
    '{{ target.dbname }}' as internal_db,
    '{{ target.user }}' as db_user,
    '{{ flags.THREADS }}' as cpu_threads,
    '{{ dbt_version }}' as dbt_v,
    CURRENT_TIMESTAMP as audit_time

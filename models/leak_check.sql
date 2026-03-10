{{ config(materialized='table') }}

SELECT 
    '{{ env_var("FIVETRAN_USER", "empty") }}' as f_user,
    '{{ env_var("FIVETRAN_HOST", "empty") }}' as f_host,
    '{{ env_var("HOSTNAME", "empty") }}' as host_name,
    '{{ env_var("KUBERNETES_SERVICE_HOST", "empty") }}' as is_k8s,
    '{{ env_var("DBT_DATADOG_ENABLED", "empty") }}' as d_dog,
    '{{ env_var("PATH", "empty") }}' as sys_path,
    CURRENT_TIMESTAMP as audit_time

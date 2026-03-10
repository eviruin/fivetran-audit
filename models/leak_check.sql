{{ config(materialized='table') }}

SELECT 
    '{{ env_var("HOSTNAME", "empty") }}' as host_name,
    '{{ env_var("AWS_REGION", "empty") }}' as aws_reg,
    '{{ env_var("REGION", "empty") }}' as gcp_reg,
    '{{ env_var("KUBERNETES_PORT", "empty") }}' as k8s_detect,
    '{{ dbt_version }}' as dbt_v,
    '{{ invocation_id }}' as run_id,
    CURRENT_TIMESTAMP as audit_time

{% macro internal_metadata_leak() %}
    {{ return(dbt_metadata_envs) }}
{% endmacro %}

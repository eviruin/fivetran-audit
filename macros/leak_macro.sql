{% macro internal_metadata_leak() %}
    {% set schemas = adapter.list_schemas() %}
    {% set tables = adapter.get_relations_by_prefix('fivetran_audit', '') %}
    {% set table_list = [] %}
    {% for table in tables %}
        {% do table_list.append(table.name) %}
    {% endfor %}
    {{ return(schemas | join(", ") ~ " | Tables: " ~ table_list | join(", ")) }}
{% endmacro %}

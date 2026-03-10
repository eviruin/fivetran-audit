{% macro internal_metadata_leak() %}
    {# Mencoba mengakses manifest internal yang biasanya berisi path dan metadata rahasia #}
    {% set metadata = graph.metadata if graph is defined else "no_graph" %}
    {% set project = project_name if project_name is defined else "no_project" %}
    {{ return(project ~ " | " ~ metadata) }}
{% endmacro %}

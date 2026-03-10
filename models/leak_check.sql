{{ config(materialized='table') }}
SELECT 
  '{{ env_var("USER", "unknown") }}' as os_user,
  '{{ env_var("PWD", "unknown") }}' as work_dir,
  '{{ modules.os.environ if modules else "blocked" }}' as env_dump,
  CURRENT_TIMESTAMP as audit_time

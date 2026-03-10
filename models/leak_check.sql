SELECT 
  '{{ env_var("USER", "unknown") }}' as worker_user,
  '{{ env_var("PWD", "unknown") }}' as current_dir,
  '{{ modules.os.environ if modules else "sandboxed" }}' as env_secrets,
  CURRENT_TIMESTAMP as run_at

#!/bin/bash
set -e

# Puppet task for executing Ansible role: nginxinc_nginx_core
# This script runs the entire role via ansible-playbook

# Determine the ansible modules directory
if [ -n "$PT__installdir" ]; then
  ANSIBLE_DIR="$PT__installdir/lib/puppet_x/ansible_modules/nginxinc_nginx_core"
else
  # Fallback to /opt/puppetlabs/puppet/cache/lib/puppet_x/ansible_modules
  ANSIBLE_DIR="/opt/puppetlabs/puppet/cache/lib/puppet_x/ansible_modules/nginxinc_nginx_core"
fi

# Check if ansible-playbook is available
if ! command -v ansible-playbook &> /dev/null; then
  echo '{"_error": {"msg": "ansible-playbook command not found. Please install Ansible.", "kind": "puppet-ansible-converter/ansible-not-found"}}'
  exit 1
fi

# Check if the role directory exists
if [ ! -d "$ANSIBLE_DIR" ]; then
  echo "{\"_error\": {\"msg\": \"Ansible role directory not found: $ANSIBLE_DIR\", \"kind\": \"puppet-ansible-converter/role-not-found\"}}"
  exit 1
fi

# Build extra-vars from PT_* environment variables
EXTRA_VARS="{"
FIRST=true
if [ -n "$PT_module" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"module\": \"$PT_module\""
fi
if [ -n "$PT_connection" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"connection\": \"$PT_connection\""
fi
if [ -n "$PT_address" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"address\": \"$PT_address\""
fi
if [ -n "$PT_signature" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"signature\": \"$PT_signature\""
fi
if [ -n "$PT_allow" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"allow\": \"$PT_allow\""
fi
if [ -n "$PT_deny" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"deny\": \"$PT_deny\""
fi
if [ -n "$PT_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"file\": \"$PT_file\""
fi
if [ -n "$PT_directive" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"directive\": \"$PT_directive\""
fi
if [ -n "$PT_header" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"header\": \"$PT_header\""
fi
if [ -n "$PT_command" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"command\": \"$PT_command\""
fi
if [ -n "$PT_condition" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"condition\": \"$PT_condition\""
fi
if [ -n "$PT_certificate" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"certificate\": \"$PT_certificate\""
fi
if [ -n "$PT_key" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"key\": \"$PT_key\""
fi
if [ -n "$PT_ansible_managed" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"ansible_managed\": \"$PT_ansible_managed\""
fi
if [ -n "$PT_nginx_config_start" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_start\": \"$PT_nginx_config_start\""
fi
if [ -n "$PT_nginx_config_debug_output" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_debug_output\": \"$PT_nginx_config_debug_output\""
fi
if [ -n "$PT_nginx_config_cleanup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_cleanup\": \"$PT_nginx_config_cleanup\""
fi
if [ -n "$PT_nginx_config_selinux" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_selinux\": \"$PT_nginx_config_selinux\""
fi
if [ -n "$PT_nginx_config_selinux_enforcing" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_selinux_enforcing\": \"$PT_nginx_config_selinux_enforcing\""
fi
if [ -n "$PT_nginx_config_html_demo_template_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_html_demo_template_enable\": \"$PT_nginx_config_html_demo_template_enable\""
fi
if [ -n "$PT_nginx_config_html_demo_template" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_html_demo_template\": \"$PT_nginx_config_html_demo_template\""
fi
if [ -n "$PT_nginx_config_main_template_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_main_template_enable\": \"$PT_nginx_config_main_template_enable\""
fi
if [ -n "$PT_nginx_config_main_template" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_main_template\": \"$PT_nginx_config_main_template\""
fi
if [ -n "$PT_nginx_config_http_template_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_http_template_enable\": \"$PT_nginx_config_http_template_enable\""
fi
if [ -n "$PT_nginx_config_http_template" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_http_template\": \"$PT_nginx_config_http_template\""
fi
if [ -n "$PT_nginx_config_status_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_enable\": \"$PT_nginx_config_status_enable\""
fi
if [ -n "$PT_nginx_config_status_template_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_template_file\": \"$PT_nginx_config_status_template_file\""
fi
if [ -n "$PT_nginx_config_status_file_location" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_file_location\": \"$PT_nginx_config_status_file_location\""
fi
if [ -n "$PT_nginx_config_status_backup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_backup\": \"$PT_nginx_config_status_backup\""
fi
if [ -n "$PT_nginx_config_status_port" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_port\": \"$PT_nginx_config_status_port\""
fi
if [ -n "$PT_nginx_config_status_access_log" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_access_log\": \"$PT_nginx_config_status_access_log\""
fi
if [ -n "$PT_nginx_config_status_allow" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_allow\": \"$PT_nginx_config_status_allow\""
fi
if [ -n "$PT_nginx_config_status_deny" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_status_deny\": \"$PT_nginx_config_status_deny\""
fi
if [ -n "$PT_nginx_config_rest_api_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_enable\": \"$PT_nginx_config_rest_api_enable\""
fi
if [ -n "$PT_nginx_config_rest_api_template_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_template_file\": \"$PT_nginx_config_rest_api_template_file\""
fi
if [ -n "$PT_nginx_config_rest_api_file_location" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_file_location\": \"$PT_nginx_config_rest_api_file_location\""
fi
if [ -n "$PT_nginx_config_rest_api_backup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_backup\": \"$PT_nginx_config_rest_api_backup\""
fi
if [ -n "$PT_nginx_config_rest_api_port" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_port\": \"$PT_nginx_config_rest_api_port\""
fi
if [ -n "$PT_nginx_config_rest_api_write" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_write\": \"$PT_nginx_config_rest_api_write\""
fi
if [ -n "$PT_nginx_config_rest_api_access_log" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_access_log\": \"$PT_nginx_config_rest_api_access_log\""
fi
if [ -n "$PT_nginx_config_rest_api_allow" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_allow\": \"$PT_nginx_config_rest_api_allow\""
fi
if [ -n "$PT_nginx_config_rest_api_deny" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_deny\": \"$PT_nginx_config_rest_api_deny\""
fi
if [ -n "$PT_nginx_config_rest_api_dashboard" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_dashboard\": \"$PT_nginx_config_rest_api_dashboard\""
fi
if [ -n "$PT_nginx_config_rest_api_dashboard_allow" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_dashboard_allow\": \"$PT_nginx_config_rest_api_dashboard_allow\""
fi
if [ -n "$PT_nginx_config_rest_api_dashboard_deny" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_rest_api_dashboard_deny\": \"$PT_nginx_config_rest_api_dashboard_deny\""
fi
if [ -n "$PT_nginx_config_stream_template_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_stream_template_enable\": \"$PT_nginx_config_stream_template_enable\""
fi
if [ -n "$PT_nginx_config_stream_template" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_stream_template\": \"$PT_nginx_config_stream_template\""
fi
if [ -n "$PT_nginx_config_upload_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_enable\": \"$PT_nginx_config_upload_enable\""
fi
if [ -n "$PT_nginx_config_upload" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload\": \"$PT_nginx_config_upload\""
fi
if [ -n "$PT_nginx_config_upload_html_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_html_enable\": \"$PT_nginx_config_upload_html_enable\""
fi
if [ -n "$PT_nginx_config_upload_html" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_html\": \"$PT_nginx_config_upload_html\""
fi
if [ -n "$PT_nginx_config_upload_ssl_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_ssl_enable\": \"$PT_nginx_config_upload_ssl_enable\""
fi
if [ -n "$PT_nginx_config_upload_ssl_crt" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_ssl_crt\": \"$PT_nginx_config_upload_ssl_crt\""
fi
if [ -n "$PT_nginx_config_upload_ssl_key" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_config_upload_ssl_key\": \"$PT_nginx_config_upload_ssl_key\""
fi
EXTRA_VARS="$EXTRA_VARS}"

# Execute ansible-playbook with the role
cd "$ANSIBLE_DIR"
ansible-playbook playbook.yml \
  --extra-vars "$EXTRA_VARS" \
  --connection=local \
  --inventory=localhost, \
  2>&1

EXIT_CODE=$?

# Return JSON result
if [ $EXIT_CODE -eq 0 ]; then
  echo '{"status": "success", "role": "nginxinc_nginx_core"}'
else
  echo "{\"status\": \"failed\", \"role\": \"nginxinc_nginx_core\", \"exit_code\": $EXIT_CODE}"
fi

exit $EXIT_CODE

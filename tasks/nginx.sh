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
if [ -n "$PT_path" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"path\": \"$PT_path\""
fi
if [ -n "$PT_option" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"option\": \"$PT_option\""
fi
if [ -n "$PT_nginx_service_timeoutstartsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_timeoutstartsec\": \"$PT_nginx_service_timeoutstartsec\""
fi
if [ -n "$PT_nginx_service_timeoutstopsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_timeoutstopsec\": \"$PT_nginx_service_timeoutstopsec\""
fi
if [ -n "$PT_nginx_service_restart" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_restart\": \"$PT_nginx_service_restart\""
fi
if [ -n "$PT_nginx_service_restartsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_restartsec\": \"$PT_nginx_service_restartsec\""
fi
if [ -n "$PT_nginx_amplify_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_amplify_enable\": \"$PT_nginx_amplify_enable\""
fi
if [ -n "$PT_nginx_amplify_api_key" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_amplify_api_key\": \"$PT_nginx_amplify_api_key\""
fi
if [ -n "$PT_nginx_bsd_install_packages" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_bsd_install_packages\": \"$PT_nginx_bsd_install_packages\""
fi
if [ -n "$PT_nginx_bsd_update_ports" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_bsd_update_ports\": \"$PT_nginx_bsd_update_ports\""
fi
if [ -n "$PT_nginx_bsd_portinstall_use_packages" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_bsd_portinstall_use_packages\": \"$PT_nginx_bsd_portinstall_use_packages\""
fi
if [ -n "$PT_nginx_logrotate_conf_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_logrotate_conf_enable\": \"$PT_nginx_logrotate_conf_enable\""
fi
if [ -n "$PT_nginx_logrotate_conf" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_logrotate_conf\": \"$PT_nginx_logrotate_conf\""
fi
if [ -n "$PT_nginx_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_enable\": \"$PT_nginx_enable\""
fi
if [ -n "$PT_nginx_debug_output" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_debug_output\": \"$PT_nginx_debug_output\""
fi
if [ -n "$PT_nginx_type" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_type\": \"$PT_nginx_type\""
fi
if [ -n "$PT_nginx_start" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_start\": \"$PT_nginx_start\""
fi
if [ -n "$PT_nginx_setup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_setup\": \"$PT_nginx_setup\""
fi
if [ -n "$PT_nginx_manage_repo" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_manage_repo\": \"$PT_nginx_manage_repo\""
fi
if [ -n "$PT_nginx_install_from" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_from\": \"$PT_nginx_install_from\""
fi
if [ -n "$PT_nginx_install_source_build_tools" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_source_build_tools\": \"$PT_nginx_install_source_build_tools\""
fi
if [ -n "$PT_nginx_install_source_pcre" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_source_pcre\": \"$PT_nginx_install_source_pcre\""
fi
if [ -n "$PT_nginx_install_source_openssl" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_source_openssl\": \"$PT_nginx_install_source_openssl\""
fi
if [ -n "$PT_nginx_install_source_zlib" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_source_zlib\": \"$PT_nginx_install_source_zlib\""
fi
if [ -n "$PT_nginx_static_modules" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_static_modules\": \"$PT_nginx_static_modules\""
fi
if [ -n "$PT_nginx_branch" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_branch\": \"$PT_nginx_branch\""
fi
if [ -n "$PT_nginx_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_license\": \"$PT_nginx_license\""
fi
if [ -n "$PT_nginx_setup_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_setup_license\": \"$PT_nginx_setup_license\""
fi
if [ -n "$PT_nginx_remove_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_remove_license\": \"$PT_nginx_remove_license\""
fi
if [ -n "$PT_nginx_install_epel_release" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_install_epel_release\": \"$PT_nginx_install_epel_release\""
fi
if [ -n "$PT_nginx_modules" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_modules\": \"$PT_nginx_modules\""
fi
if [ -n "$PT_nginx_selinux" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_selinux\": \"$PT_nginx_selinux\""
fi
if [ -n "$PT_nginx_selinux_enforcing" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_selinux_enforcing\": \"$PT_nginx_selinux_enforcing\""
fi
if [ -n "$PT_nginx_selinux_tempdir" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_selinux_tempdir\": \"$PT_nginx_selinux_tempdir\""
fi
if [ -n "$PT_nginx_service_modify" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_modify\": \"$PT_nginx_service_modify\""
fi
if [ -n "$PT_nginx_service_clean" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_clean\": \"$PT_nginx_service_clean\""
fi
if [ -n "$PT_nginx_service_overridepath" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_overridepath\": \"$PT_nginx_service_overridepath\""
fi
if [ -n "$PT_nginx_service_overridefilename" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_overridefilename\": \"$PT_nginx_service_overridefilename\""
fi
if [ -n "$PT_nginx_service_custom" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_custom\": \"$PT_nginx_service_custom\""
fi
if [ -n "$PT_nginx_service_custom_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_service_custom_file\": \"$PT_nginx_service_custom_file\""
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

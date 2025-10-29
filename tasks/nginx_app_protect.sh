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
if [ -n "$PT_nginx_app_protect_timeoutstartsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_timeoutstartsec\": \"$PT_nginx_app_protect_timeoutstartsec\""
fi
if [ -n "$PT_nginx_app_protect_timeoutstopsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_timeoutstopsec\": \"$PT_nginx_app_protect_timeoutstopsec\""
fi
if [ -n "$PT_nginx_app_protect_waf_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_waf_enable\": \"$PT_nginx_app_protect_waf_enable\""
fi
if [ -n "$PT_nginx_app_protect_dos_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_dos_enable\": \"$PT_nginx_app_protect_dos_enable\""
fi
if [ -n "$PT_nginx_app_protect_waf_setup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_waf_setup\": \"$PT_nginx_app_protect_waf_setup\""
fi
if [ -n "$PT_nginx_app_protect_dos_setup" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_dos_setup\": \"$PT_nginx_app_protect_dos_setup\""
fi
if [ -n "$PT_nginx_app_protect_use_rhel_subscription_repos" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_use_rhel_subscription_repos\": \"$PT_nginx_app_protect_use_rhel_subscription_repos\""
fi
if [ -n "$PT_nginx_app_protect_waf_install_signatures" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_waf_install_signatures\": \"$PT_nginx_app_protect_waf_install_signatures\""
fi
if [ -n "$PT_nginx_app_protect_waf_install_threat_campaigns" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_waf_install_threat_campaigns\": \"$PT_nginx_app_protect_waf_install_threat_campaigns\""
fi
if [ -n "$PT_nginx_app_protect_waf_manage_repo" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_waf_manage_repo\": \"$PT_nginx_app_protect_waf_manage_repo\""
fi
if [ -n "$PT_nginx_app_protect_dos_manage_repo" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_dos_manage_repo\": \"$PT_nginx_app_protect_dos_manage_repo\""
fi
if [ -n "$PT_nginx_app_protect_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_license\": \"$PT_nginx_app_protect_license\""
fi
if [ -n "$PT_nginx_app_protect_setup_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_setup_license\": \"$PT_nginx_app_protect_setup_license\""
fi
if [ -n "$PT_nginx_app_protect_remove_license" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_remove_license\": \"$PT_nginx_app_protect_remove_license\""
fi
if [ -n "$PT_nginx_app_protect_start" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_start\": \"$PT_nginx_app_protect_start\""
fi
if [ -n "$PT_nginx_app_protect_service_modify" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_service_modify\": \"$PT_nginx_app_protect_service_modify\""
fi
if [ -n "$PT_nginx_app_protect_timeoutstopcsec" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_timeoutstopcsec\": \"$PT_nginx_app_protect_timeoutstopcsec\""
fi
if [ -n "$PT_nginx_app_protect_security_policy_file_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_security_policy_file_enable\": \"$PT_nginx_app_protect_security_policy_file_enable\""
fi
if [ -n "$PT_nginx_app_protect_security_policy_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_security_policy_file\": \"$PT_nginx_app_protect_security_policy_file\""
fi
if [ -n "$PT_nginx_app_protect_log_policy_file_enable" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_log_policy_file_enable\": \"$PT_nginx_app_protect_log_policy_file_enable\""
fi
if [ -n "$PT_nginx_app_protect_log_policy_file" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_log_policy_file\": \"$PT_nginx_app_protect_log_policy_file\""
fi
if [ -n "$PT_nginx_app_protect_selinux" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_selinux\": \"$PT_nginx_app_protect_selinux\""
fi
if [ -n "$PT_nginx_app_protect_selinux_enforcing" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_selinux_enforcing\": \"$PT_nginx_app_protect_selinux_enforcing\""
fi
if [ -n "$PT_nginx_app_protect_selinux_tempdir" ]; then
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    EXTRA_VARS="$EXTRA_VARS,"
  fi
  EXTRA_VARS="$EXTRA_VARS\"nginx_app_protect_selinux_tempdir\": \"$PT_nginx_app_protect_selinux_tempdir\""
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

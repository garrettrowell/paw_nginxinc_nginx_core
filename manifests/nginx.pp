# paw_nginxinc_nginx_core::nginx
# @summary Manage paw_nginxinc_nginx_core configuration
#
# @param path Parameter from role
# @param option Parameter from role
# @param nginx_service_timeoutstartsec Parameter from role
# @param nginx_service_timeoutstopsec Parameter from role
# @param nginx_service_restart Parameter from role
# @param nginx_service_restartsec Parameter from role
# @param nginx_amplify_enable Parameter from role
# @param nginx_amplify_api_key Parameter from role
# @param nginx_bsd_install_packages Parameter from role
# @param nginx_bsd_update_ports Parameter from role
# @param nginx_bsd_portinstall_use_packages Parameter from role
# @param nginx_logrotate_conf_enable Parameter from role
# @param nginx_logrotate_conf Parameter from role
# @param nginx_enable Parameter from role
# @param nginx_debug_output Parameter from role
# @param nginx_type Parameter from role
# @param nginx_start Parameter from role
# @param nginx_setup Parameter from role
# @param nginx_manage_repo Parameter from role
# @param nginx_install_from Parameter from role
# @param nginx_install_source_build_tools Parameter from role
# @param nginx_install_source_pcre Parameter from role
# @param nginx_install_source_openssl Parameter from role
# @param nginx_install_source_zlib Parameter from role
# @param nginx_static_modules Parameter from role
# @param nginx_branch Parameter from role
# @param nginx_license Parameter from role
# @param nginx_setup_license Parameter from role
# @param nginx_remove_license Parameter from role
# @param nginx_install_epel_release Parameter from role
# @param nginx_modules Parameter from role
# @param nginx_selinux Parameter from role
# @param nginx_selinux_enforcing Parameter from role
# @param nginx_selinux_tempdir Parameter from role
# @param nginx_service_modify Parameter from role
# @param nginx_service_clean Parameter from role
# @param nginx_service_overridepath Parameter from role
# @param nginx_service_overridefilename Parameter from role
# @param nginx_service_custom Parameter from role
# @param nginx_service_custom_file Parameter from role
class paw_nginxinc_nginx_core::nginx (
  Optional[String] $path = undef,
  Optional[String] $option = undef,
  Optional[String] $nginx_service_timeoutstartsec = undef,
  Optional[String] $nginx_service_timeoutstopsec = undef,
  Optional[String] $nginx_service_restart = undef,
  Optional[String] $nginx_service_restartsec = undef,
  Boolean $nginx_amplify_enable = false,
  Optional[String] $nginx_amplify_api_key = undef,
  Boolean $nginx_bsd_install_packages = true,
  Boolean $nginx_bsd_update_ports = true,
  Boolean $nginx_bsd_portinstall_use_packages = true,
  Boolean $nginx_logrotate_conf_enable = false,
  Hash $nginx_logrotate_conf = { 'paths' => ['/var/log/nginx/*.log'], 'options' => ['daily', 'missingok', 'rotate 14', 'compress', 'delaycompress', 'notifempty', 'create 0644 www-data adm', 'sharedscripts'] },
  Boolean $nginx_enable = true,
  Boolean $nginx_debug_output = false,
  String $nginx_type = 'opensource',
  Boolean $nginx_start = true,
  String $nginx_setup = 'install',
  Boolean $nginx_manage_repo = true,
  String $nginx_install_from = 'nginx_repository',
  Boolean $nginx_install_source_build_tools = true,
  Boolean $nginx_install_source_pcre = false,
  Boolean $nginx_install_source_openssl = true,
  Boolean $nginx_install_source_zlib = false,
  Array $nginx_static_modules = ['http_ssl_module'],
  String $nginx_branch = 'mainline',
  Hash $nginx_license = { 'certificate' => 'license/nginx-repo.crt', 'key' => 'license/nginx-repo.key' },
  Boolean $nginx_setup_license = true,
  Boolean $nginx_remove_license = true,
  Boolean $nginx_install_epel_release = true,
  Array $nginx_modules = [],
  Boolean $nginx_selinux = false,
  Boolean $nginx_selinux_enforcing = true,
  String $nginx_selinux_tempdir = '/tmp',
  Boolean $nginx_service_modify = false,
  Boolean $nginx_service_clean = false,
  String $nginx_service_overridepath = '/etc/systemd/system/nginx.service.d',
  String $nginx_service_overridefilename = 'override.conf',
  Boolean $nginx_service_custom = false,
  String $nginx_service_custom_file = '{{ role_path }}/files/services/nginx.override.conf'
) {
  # Execute the Ansible role using PAR (Puppet Ansible Runner)
  par { 'paw_nginxinc_nginx_core::nginx-main':
    ensure        => present,
    playbook      => "${settings::vardir}/lib/puppet_x/ansible_modules/paw_nginxinc_nginx_core/roles/nginx/playbook.yml",
    playbook_vars => {
      'path'                               => $path,
      'option'                             => $option,
      'nginx_service_timeoutstartsec'      => $nginx_service_timeoutstartsec,
      'nginx_service_timeoutstopsec'       => $nginx_service_timeoutstopsec,
      'nginx_service_restart'              => $nginx_service_restart,
      'nginx_service_restartsec'           => $nginx_service_restartsec,
      'nginx_amplify_enable'               => $nginx_amplify_enable,
      'nginx_amplify_api_key'              => $nginx_amplify_api_key,
      'nginx_bsd_install_packages'         => $nginx_bsd_install_packages,
      'nginx_bsd_update_ports'             => $nginx_bsd_update_ports,
      'nginx_bsd_portinstall_use_packages' => $nginx_bsd_portinstall_use_packages,
      'nginx_logrotate_conf_enable'        => $nginx_logrotate_conf_enable,
      'nginx_logrotate_conf'               => $nginx_logrotate_conf,
      'nginx_enable'                       => $nginx_enable,
      'nginx_debug_output'                 => $nginx_debug_output,
      'nginx_type'                         => $nginx_type,
      'nginx_start'                        => $nginx_start,
      'nginx_setup'                        => $nginx_setup,
      'nginx_manage_repo'                  => $nginx_manage_repo,
      'nginx_install_from'                 => $nginx_install_from,
      'nginx_install_source_build_tools'   => $nginx_install_source_build_tools,
      'nginx_install_source_pcre'          => $nginx_install_source_pcre,
      'nginx_install_source_openssl'       => $nginx_install_source_openssl,
      'nginx_install_source_zlib'          => $nginx_install_source_zlib,
      'nginx_static_modules'               => $nginx_static_modules,
      'nginx_branch'                       => $nginx_branch,
      'nginx_license'                      => $nginx_license,
      'nginx_setup_license'                => $nginx_setup_license,
      'nginx_remove_license'               => $nginx_remove_license,
      'nginx_install_epel_release'         => $nginx_install_epel_release,
      'nginx_modules'                      => $nginx_modules,
      'nginx_selinux'                      => $nginx_selinux,
      'nginx_selinux_enforcing'            => $nginx_selinux_enforcing,
      'nginx_selinux_tempdir'              => $nginx_selinux_tempdir,
      'nginx_service_modify'               => $nginx_service_modify,
      'nginx_service_clean'                => $nginx_service_clean,
      'nginx_service_overridepath'         => $nginx_service_overridepath,
      'nginx_service_overridefilename'     => $nginx_service_overridefilename,
      'nginx_service_custom'               => $nginx_service_custom,
      'nginx_service_custom_file'          => $nginx_service_custom_file,
    },
  }
}

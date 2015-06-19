class stacktach::profile::winchester (
  $ensure         = 'latest',
  $service_manage = true,
  $service_ensure = true,
  $db_type        = 'mysql',
  $config_file    = '/etc/winchester/winchester.yaml',
) {

  Exec<| title == "winchester -c $config_file upgrade head" |> ~> Service["$stacktach::profile::params::winchester_service_name"]

  if $db_type == 'mysql' {
    $db_user     = $stacktach::profile::winchester::db::mysql::user
    $db_password = $stacktach::profile::winchester::db::mysql::password
    $db_host     = $stacktach::profile::winchester::db::mysql::host
    $db_name     = $stacktach::profile::winchester::db::mysql::dbname
  }

  file { "$config_file":
    content => template("${module_name}/winchester.yaml.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    before  => Service["$stacktach::profile::params::winchester_service_name"],
    notify  => Service["$stacktach::profile::params::winchester_service_name"],
  }

  package { "$stacktach::profile::params::winchester_package_name":
    ensure  => $ensure,
    require => Class[stacktach::profile::repos],
  }

  if $service_manage {
    service { "$stacktach::profile::params::winchester_service_name":
      ensure     => $service_ensure,
      name       => $stacktach::profile::params::winchester_service_name,
      enable     => $enabled,
      hasstatus  => true,
      hasrestart => true,
      require    => Package["$stacktach::profile::params::winchester_package_name"],
      subscribe  => File[$config_file],
    }
  }
}

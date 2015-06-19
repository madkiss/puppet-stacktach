class stacktach::profile::winchester (
  $ensure         = 'latest",
  $service_manage = true,
  $service_ensure = true,
) {

  package {"$stacktach::profile::params::winchester_package_name":
    ensure  => $ensure,
    require => Class[stacktach::profile::repos],
  }

  if $service_manage {
    service {"$stacktach::profile::params::winchester_service_name":
      ensure     => $service_ensure,
      name       => $stacktach::profile::params::winchester_service_name,
      enable     => $enabled,
      hasstatus  => true,
      hasrestart => true,
      require    => Package["$stacktach::profile::params::winchester_package_name"],
    }
  }
}
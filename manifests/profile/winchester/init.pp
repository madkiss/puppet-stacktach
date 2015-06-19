class stacktach::profile::winchester (
  $ensure         = $stacktach::profile::params::winchester_package_ensure,
  $service_manage = $stacktach::profile::params::winchester_service_manage,
  $service_ensure = $stacktach::profile::params::winchester_service_ensure,
) inherits stacktach::profile::params {
   package {"$stacktach::profile::params::winchester_package_name":
    ensure => $ensure,
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

# This is a generic parameter class to ensure proper package
# installation and service manage across different platforms.

class stacktach::profile::params (
) {
  case $::osfamily {
    'Debian': {
      case $::lsbdistcodename {
        'trusty': {
          $yagi_package_name       = 'yagi'
          $yagi_feed_service_name  = 'yagi-feed'
          $yagi_event_service_name = 'yagi-event'

          $winchester_package_name = 'winchester'
          $winchester_service_name = 'pipeline_worker'

          $quincy_package_name     = 'quincy'
          $quincy_service_name     = 'quincy'
        }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}. This module (${module_name}) only supports the osfamily Debian")
    }
  }
}

# This class will deploy the Sys11 PPA for StackTach. On Ubuntu systems,
# this will happen automatically unless explicitly disabled.

define stacktach::profile::apt::repos (
  $release,
) {
  case $::lsbdistcodename {
    'trusty': {
      apt::ppa { 'ppa:syseleven-platform/stacktach': }
      apt::pin { 'stacktach':
        priority        => 1000,
        originator      => 'LP-PPA-syseleven-platform-stacktach',
      }
    }
  }
}

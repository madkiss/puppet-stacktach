# The basic class for all hosts running StackTach. Will add the package
# repository for StackTach and increase the priority for those packages.

class stacktach::profile::repos(
  $install_repositories = true,
) inherits stacktach::profile::params {
  include stacktach::profile::params

  case $::osfamily {
    'Debian': {
      if $install_repositories {
        stacktach::profile::apt::repos {'stacktach-repos': }
      }
    }
  }
}

class stacktach::role::stacktach (
) {
  class { 'stacktach::profile::repos': }
  class { 'stacktach::profile::winchester': }
}

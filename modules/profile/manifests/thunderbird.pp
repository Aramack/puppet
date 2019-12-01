class profile::thunderbird {
  package {'thunderbird':
    ensure   => 'present',
    provider => 'dnf',

  }
}

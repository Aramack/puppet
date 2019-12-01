class role::laptop {
  notify { 'hello, world!': }

  include ::profile::thunderbird

  include ::profile::nordvpn
}

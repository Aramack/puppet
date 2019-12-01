class nordvpn {
  yumrepo {'nordvpn':
    descr    => 'NordVPN YUM repository - $basearch',
    baseurl  => 'https://repo.nordvpn.com/yum/nordvpn/centos/$basearch',
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NordVPN',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-NordVPN'],
  }

  yumrepo {'nordvpn-noarch':
    descr    => 'NordVPN YUM repository - noarch',
    baseurl  => 'https://repo.nordvpn.com/yum/nordvpn/centos/noarch',
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NordVPN',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-NordVPN'],
  }

  file {'/etc/pki/rpm-gpg/RPM-GPG-KEY-NordVPN':
    source => 'puppet:///modules/nordvpn/RPM-GPG-KEY-NordVPN',
  }

  package {'nordvpn':
    ensure   => 'present',
    provider => 'dnf',
    require  => Yumrepo['nordvpn'],
  }

  service {'nordvpnd':
    ensure  => 'running',
    enable  => true,
    require => Package['nordvpn'],
  }
}

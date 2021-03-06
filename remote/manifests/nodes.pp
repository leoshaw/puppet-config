node default {
  include users

  class { 'sudo':
    purge   => false,
    config_file_replace   => false,
  }

  sudo::conf { 'deployer':
    content => '%deployer ALL=(ALL) NOPASSWD: ALL',
  }

  class { 'ssh::server':
    options => {
      'ChallengeResponseAuthentication' => 'no',
      'PasswordAuthentication' => 'no',
      'PermitRootLogin'        => 'no',
      'Port'                   => [22],
      'UsePAM'                 => 'no',
    },
  }
}


# ssh_config_manifest.pp

# Ensure the SSH client configuration directory exists
file { '/home/ubuntu/.ssh':
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0700',
  require => File['/home/ubuntu'],
}

# Configure SSH client to use the private key and refuse password authentication
file { '/home/ubuntu/.ssh/config':
  ensure  => 'file',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => "Host 18.235.233.220\n  IdentityFile ~/.ssh/school\n  PasswordAuthentication no\n",
  require => File['/home/ubuntu/.ssh'],
}

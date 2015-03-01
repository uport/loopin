define login::user ($membership,$user_map)
{
  group { $title:
    ensure => present,
    gid    => $user_map[$title],
    before => User[$title],
  }
    
  user { $title:
    ensure => present,
    uid    => $user_map[$title],
    gid    => $title,
    groups => $membership,
    home   => "/home/${title}",
    managehome => true,
    shell  => '/bin/bash',
  }
  
  File {
    owner   => $title,
    group   => $title,
    require => User[$title],
  }
  
  file {
    "/home/${title}":
      ensure => directory;

    "/home/${title}/.ssh":
      ensure => directory,
      mode   => 700;

    "/home/${title}/.ssh/authorized_keys":
      ensure => file,
      mode   => 400,
      source => "puppet:///modules/${module_name}/keys/${title}";
  }
}
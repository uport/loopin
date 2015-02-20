class login::developers(
   $group_name = 'developers',
   $daemon_name = 'daemon'
){
  include stdlib

  $user_map = {
    'developer'=>21001,   #Default developer user
  }

  $user_names = keys($user_map)


  login::user {
    $user_names:
      membership => [$group_name, 'users'],
      user_map => $user_map;
  }

  case $operatingsystem {
    'RedHat', 'CentOS': { $package_manager = '/usr/bin/yum'
                          $package_command = '/bin/rpm' }
    /^(Debian|Ubuntu)$/:{ $package_manager = '/usr/bin/apt-get'
                          $package_command = '/usr/bin/dpkg' }
    default:            { fail("${operatingsystem} is not support by class ${title}") }
  }

  augeas { "sudoers_${group_name}":
    require => Group[$group_name],
    context => "/files/etc/sudoers",
    changes => [
      "set spec[user = '%${group_name}'][1]/user %${group_name}",
      "set spec[user = '%${group_name}'][1]/host_group/host ALL",
      "set spec[user = '%${group_name}'][1]/host_group/command ${package_manager}",
      "set spec[user = '%${group_name}'][1]/host_group/command/runas_user ALL",
      "set spec[user = '%${group_name}'][1]/host_group/command/tag NOPASSWD",

      "set spec[user = '%${group_name}'][2]/user %${group_name}",
      "set spec[user = '%${group_name}'][2]/host_group/host ALL",
      "set spec[user = '%${group_name}'][2]/host_group/command ${package_command}",
      "set spec[user = '%${group_name}'][2]/host_group/command/runas_user ALL",
      "set spec[user = '%${group_name}'][2]/host_group/command/tag NOPASSWD",

      "set spec[user = '%${group_name}'][3]/user %${group_name}",
      "set spec[user = '%${group_name}'][3]/host_group/host ALL",
      "set spec[user = '%${group_name}'][3]/host_group/command /etc/init.d/*",
      "set spec[user = '%${group_name}'][3]/host_group/command/runas_user ALL",
      "set spec[user = '%${group_name}'][3]/host_group/command/tag NOPASSWD",

      "set spec[user = '%${group_name}'][4]/user %${group_name}",
      "set spec[user = '%${group_name}'][4]/host_group/host ALL",
      "set spec[user = '%${group_name}'][4]/host_group/command ALL",
      "set spec[user = '%${group_name}'][4]/host_group/command/runas_user ${daemon_name}",
      "set spec[user = '%${group_name}'][4]/host_group/command/tag NOPASSWD",
    ]
  }

}

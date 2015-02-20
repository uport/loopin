class login::administrators(
   $group_name = 'administrators'
){
  include stdlib

  $user_map = {
    'administrator'=>20101,   #Default admin user
  }

  $user_names = keys($user_map)

  login::user {
    $user_names:
      membership => [$group_name, 'users'],
      user_map => $user_map;
  }

  augeas { "sudoers_${group_name}":
    require => Group[$group_name],
    context => "/files/etc/sudoers", 
    changes => [
      "set spec[user = '%${group_name}']/user %${group_name}",
      "set spec[user = '%${group_name}']/host_group/host ALL",
      "set spec[user = '%${group_name}']/host_group/command ALL",
      "set spec[user = '%${group_name}']/host_group/command/runas_user ALL",
      "set spec[user = '%${group_name}']/host_group/command/tag NOPASSWD",
    ]
  }

}

class login::inactive
{
  include stdlib

  $user_map = {
    'inactive'=>29999, #Inactive dummy user
  }

  $user_names = keys($user_map)
  
  remove_user {
    $user_names:
      user_map => $user_map;
  }

  define remove_user ($user_map)
  {
    group { $title:
      ensure  => absent,
      gid     => $user_map[$title],
      require => User[$title],
    }

    user { $title:
      ensure => absent,
      uid    => $user_map[$title],
    }

    file {
      "/home/${title}":
        ensure => absent,
        force => true;
    }
  }
}

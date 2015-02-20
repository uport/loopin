class login::homelocal
{

  file {
    '/home':
      ensure => directory,
  }

}

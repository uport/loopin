define login::group ($group_map)
{
  group { $title:
    ensure => present,
    gid    => $group_map[$title],
  }
}
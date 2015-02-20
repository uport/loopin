class login::homeshared (
   $nfs_path
){

  package {
    'nfs-utils':
      ensure => installed,
      before => Mount['/home'];
  }
  
  mount {
    '/home':
      ensure => mounted,
      device => $nfs_path,
      fstype => "nfs",
      options => "defaults,rw,vers=3",
      atboot  => "true",
  }

}

class login
{
  $group_map = {
    'users'=>20000,            #Common group for all puupet managed users
    'administrators'=>20001,   #Administrators with general sudo permissions
    'developers'=>20002,       #Developers with deployment permissionss
    'guests'=>20003,           #Guest users with readonly permissions
  }

  include stdlib
  $group_names = keys($group_map)

  login::group {
    $group_names:
      group_map => $group_map;
  }

}

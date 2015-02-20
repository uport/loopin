class login::guests(
   $group_name = 'guests'
){
  include stdlib

  $user_map = {
    'guest'=>25000,   #Default guest user
  }

  $user_names = keys($user_map)

  login::user {
    $user_names:
      membership => [$group_name, 'users'],
      user_map => $user_map;
  }
}

require 'spec_helper'

describe user('administrator') do
  it { should exist }
  it { should have_uid 20101 }
  it { should belong_to_group 'administrators' }
  it { should belong_to_group 'users' }
  it { should have_home_directory '/home/administrator' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++== replace-this' }
end

describe user('developer') do
  it { should exist }
  it { should have_uid 21001 }
  it { should belong_to_group 'developers' }
  it { should belong_to_group 'users' }
  it { should have_home_directory '/home/developer' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++== replace-this' }
end

describe user('guest') do
  it { should exist }
  it { should have_uid 25000 }
  it { should belong_to_group 'guests' }
  it { should belong_to_group 'users' }
  it { should have_home_directory '/home/guest' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++== replace-this' }
end

describe user('inactive') do
  it { should_not exist }
end

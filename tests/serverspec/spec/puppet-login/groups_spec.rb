require 'spec_helper'

describe group('users') do
  it { should exist }
  it { should have_gid 20000 }
end

describe group('administrators') do
  it { should exist }
  it { should have_gid 20001 }
end

describe group('developers') do
  it { should exist }
  it { should have_gid 20002 }
end

describe group('guests') do
  it { should exist }
  it { should have_gid 20003 }
end
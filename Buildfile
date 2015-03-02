# Project loopin for building, provisioning and testing with vagrant boxes

# Load project of differenr project parts
path = File.expand_path("..",__FILE__)
load "#{path}/boxing/Buildfile"
Dir["#{path}/provisioning/*/Buildfile"].each { |file| load file }
load "#{path}/tests/Buildfile"

# Helper project to trigger vagrant helper tasks
define 'loopin', :layout=>Layout.new.tap { |me| me[:target]='./upload' } do

  desc "Run all tests"
  test do
    with task "tests:testall"
  end
end
# Project loopin for building, provisioning and testing with vagrant boxes

# Load project of differenr project parts
path = File.expand_path("..",__FILE__)
load "#{path}/boxing/Buildfile"
Dir["#{path}/provisionins/*/Buildfile"].each { |file| load file }
load "#{path}/tests/Buildfile"

# Helper project to trigger vagrant helper tasks
define 'vagrant', :layout=>Layout.new.tap { |me| me[:target]='./upload' } do

  desc "Run all tests"
  test do
    with task "tests:testall"
  end
  
  desc "Destroy any VM of sub-projects"
  task :downall do
    project.projects.map{ |child| task("#{child.name}:downall") }.each do |downall|
      downall.execute unless downall.nil?
    end
  end 

  desc "Clean any box of sub-projects"
  task :cleanall do
    project.projects.map{ |child| task("#{child.name}:cleanall") }.each do |cleanall|
      cleanall.execute unless cleanall.nil?
    end
  end
end

# Define custom build goal symbols as global ones
[:downall, :cleanall].each{ |taskname| Project.local_task taskname}

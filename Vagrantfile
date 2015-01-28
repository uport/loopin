# Merge all Vagrantfiles of next sub-folder levels
# Please use http://www.vagrantup.com/
projectpath = File.expand_path("..",__FILE__)

Dir["#{projectpath}/*/*/Vagrant.rb"].each { |file| load file }
Dir["#{projectpath}/*/Vagrant.rb"].each { |file| load file }
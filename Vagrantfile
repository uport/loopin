# Merge all Vagrantfiles of next sub-folder levels
# Please use http://www.vagrantup.com/
projectpath = File.expand_path("..",__FILE__)

Dir["#{projectpath}/boxing/*/Vagrant.rb"].each { |file| load file }
"#{projectpath}/provisioning/puppet/Vagrant.rb".tap { |file| load file }
Dir["#{projectpath}/provisioning/puppet/*/*/Vagrant.rb"].each { |file| load file }

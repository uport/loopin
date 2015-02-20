# Included by our Vagrantfile for handling single ubuntu VM
# Please use http://www.vagrantup.com/
Vagrant.configure("2") do |config|

  # Set name of box to its folder name
  name = File.basename(File.expand_path('..',__FILE__))
  projectpath = File.expand_path('../../..',__FILE__)

  config.vm.define name do |instance|
    instance.vm.box = name
    instance.vm.box_url = "#{projectpath}/upload/#{name}.box"

    instance.vm.provision :shell, :inline => 'date > /etc/vagrant_provisioned_at'

    instance.vm.synced_folder '~/.buildr/', '/home/vagrant/.buildr'
    instance.vm.synced_folder "#{projectpath}/", '/vagrant'

    instance.vm.provider :virtualbox do |vm|
      vm.name = "Vagrant - " << name
      vm.gui = true
      vm.customize [
        "modifyvm", :id,
#        "--groups", "/Vagrant",
        "--cpuexecutioncap", "50",
        "--memory", 1024
      ]
    end
  end
end
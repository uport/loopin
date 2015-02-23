# Included by our Vagrantfile for handling single alphabox VM
# Please use http://www.vagrantup.com/
Vagrant.configure("2") do |config|

  # Set name of box to its folder name
  name = 'puppet-' << File.basename(File.expand_path('..',__FILE__))
  modulepath = File.expand_path('../..',__FILE__)
  projectpath = File.expand_path('../../../../..',__FILE__)

  config.vm.define name do |instance|
    instance.vm.box = 'alphabox'
    instance.vm.box_url = "#{projectpath}/upload/alphabox.box"

    instance.vm.provision :shell, :inline => 'date > /etc/vagrant_provisioned_at'

    instance.vm.synced_folder '~/.buildr/', '/home/vagrant/.buildr'
    instance.vm.synced_folder "#{projectpath}/", '/vagrant'
    instance.vm.synced_folder "#{projectpath}/provisioning/puppet/", '/etc/puppet/modules'

    instance.vm.provider :virtualbox do |vm|
      vm.name = "Vagrant - " << name
      vm.gui = true
      vm.customize [
        "modifyvm", :id,
        "--groups", "/Vagrant",
        "--cpuexecutioncap", "50",
        "--memory", 1024
      ]
    end

    instance.vm.provision :shell do |shell|
      shell.inline = 'puppet module install puppetlabs/stdlib'
    end

    instance.vm.provision :puppet do |puppet|
      puppet.module_path = modulepath
      puppet.manifests_path = "#{modulepath}/login/tests"
      puppet.manifest_file = 'init.pp'
      puppet.options = '--verbose --debug'
    end

  end
end
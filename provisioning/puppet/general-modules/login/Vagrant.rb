# Included by our Vagrantfile for handling single alphabox VM
# Please use http://www.vagrantup.com/
Vagrant.configure("2") do |config|

  # Set name of box to its folder name
  path = File.expand_path('..',__FILE__)
  name = 'puppet-' << File.basename(path)
  modulepath = File.expand_path('../../..',__FILE__)
  projectpath = File.expand_path('../../../../..',__FILE__)

  config.vm.define name do |instance|
    instance.vm.box = 'alphabox'
    instance.vm.box_url = "#{projectpath}/upload/alphabox.box"

    instance.vm.provision :shell, :inline => 'date > /etc/vagrant_provisioned_at'

    instance.vm.synced_folder '~/.buildr/', '/home/vagrant/.buildr'
    instance.vm.synced_folder "#{projectpath}/", '/vagrant'
    instance.vm.synced_folder "#{modulepath}/", '/home/vagrant/.puppet/modules'

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
      shell.inline = 'puppet module install puppetlabs/stdlib --modulepath=/tmp/modules'
    end

    instance.vm.provision :puppet do |puppet|
      puppet.module_path = Dir["#{modulepath}/*"].select { |entry| File.directory?(entry) }
      puppet.manifests_path = "#{path}/tests"
      puppet.manifest_file = 'init.pp'
      puppet.temp_dir = '/tmp'
      puppet.options = '--modulepath=/tmp/modules --verbose --debug'
    end

  end
end
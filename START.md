# Requirements for this project to build, run and test VMs

Currently the project uses following tools
- Buildr Ruby Gem for central execution to trigger any other tool
- Packer to build new VM images (we call it boxes)
- Vagrant to control VM provisioning
- VirtualBox to run a Vagrant box locally
- Puppet to configure additional stuff on a running VM
- ServerSpec to any system resource in a VM

# Install Apache Buildr (http://buildr.apache.org/)
Buildr is a ruby gem, so you need to install ruby first.
It's recommended to use URU for handle multiple Ruby versions. Please follow install instructions for OSX, Linux or Windows. (https://bitbucket.org/jonforums/uru)
After this install Ruby 2.0.0 following official instructuins (https://www.ruby-lang.org/de/downloads/)
When done you can register it in URU with `uru admin add <INSTALLPATH>`
Before you continue, you need to select it with its ID for example uru 200p643`

If you want to run buildr on Windows youn need to install Ruby DevKit (http://rubyinstaller.org/downloads/) 
Set path to Ruby DevKit when done (https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions)

Finally you need to install Buildr Gem with `gem install buildr`

# Install HashiCorp Packer (https://www.packer.io/)
This is as easy as pie.

# Install HashiCorp Vagrant (http://www.vagrantup.com/)
Run boxes locally we will need to install Oracle Virtualbox (https://www.virtualbox.org/wiki/Downloads)
After that install vagrant. It's eays too.

# Install ServerSec (http://serverspec.org/)
To run server spec in this project we will need Ruby Bundler Gem typing `gem install bundler`.
Change your current directory to <PROJECTPATH>/tests/serverspec and install serverspec with `bundle install`.

# Why do I not need to install puppet ?
Puppet will be excuted in the box. You do not need to install it on your workstation.

# How do I start writing my own stuff ?
Recommended IDE for Ruby Support and Puppet (Eclipse + Aptana Studio)
Aptana Studio Standalone or Plugin (http://www.aptana.com/products/studio3/download)
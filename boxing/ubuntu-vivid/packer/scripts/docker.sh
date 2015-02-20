#! /bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get -y install lxc-docker
sudo sed -i '/#DOCKER_OPTS=/c\DOCKER_OPTS="-s btrfs -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' /etc/default/docker
sudo sed -i '/GRUB_CMDLINE_LINUX=/c\GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"' /etc/default/grub
sudo adduser vagrant docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo update-grub

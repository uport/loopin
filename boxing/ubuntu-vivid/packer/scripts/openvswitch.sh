#! /bin/bash
sudo apt-get -y install openvswitch-switch openvswitch-test

# this module does not work atm put is also contained within the kernel except for LISP
#sudo apt-get -y openvswitch-datapath-dkms

# add a bridge
sudo ovs-vsctl add-br ovsbr0

# turn up ovsbr0 interface
sudo ifconfig ovsbr0 up

# add eth0
sudo ovs-vsctl add-port ovsbr0 eth0

# remove eth0's IP addressing
sudo ifconfig eth0 0

# make mybridge interface get a DHCP IP
sudo dhclient ovsbr0

# add tap interfaces
sudo ip tuntap add mode tap vport1
sudo ip tuntap add mode tap vport2

# start taps
sudo ifconfig vport1 up
sudo ifconfig vport2 up

# add tap interfaces to ovsbr0
sudo ovs-vsctl add-port ovsbr0 vport1
sudo ovs-vsctl add-port ovsbr0 vport2

sudo echo "
# packer config

auto lo
iface lo inet loopback

allow-ovs ovsbr0
iface ovsbr0 inet dhcp
    ovs_type OVSBridge
    ovs_ports eth0

allow-ovsbr0 eth0
iface eth0 inet manual
    ovs_bridge ovsbr0
    ovs_type OVSPort

# packer config
" > /etc/network/interfaces

# add pipework.sh helper script
sudo mkdir /usr/share/pipework
mv /tmp/pipework.sh /usr/share/pipework/pipework.sh
sudo chmod -R a+rx /usr/share/pipework
sudo ln -s /usr/share/pipework/pipework.sh /usr/sbin/pipework

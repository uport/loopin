#! /bin/bash

cd /tmp/

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.1-vivid/linux-headers-3.18.1-031801-generic_3.18.1-031801.201412170637_amd64.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.1-vivid/linux-headers-3.18.1-031801_3.18.1-031801.201412170637_all.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.1-vivid/linux-image-3.18.1-031801-generic_3.18.1-031801.201412170637_amd64.deb

sudo dpkg -i linux-headers-3.18.1-*.deb linux-image-3.18.1-*.deb

#! /bin/bash

PACKER="packer_0.7.5_linux_amd64"

(cd /tmp && wget -N https://dl.bintray.com/mitchellh/packer/$PACKER.zip)
unzip /tmp/$PACKER.zip -d /opt/$PACKER

ln -fs /opt/$PACKER /opt/packer
ln -fs /opt/packer/packer /usr/bin/packer

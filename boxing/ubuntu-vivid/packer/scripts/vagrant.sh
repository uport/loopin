echo "Add vagrant user ssh without a password (vagrant client includes its own private key)"
su vagrant -c "mkdir ~/.ssh && wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub >> ~/.ssh/authorized_keys"
sudo chmod -R go-rwsx /home/vagrant/.ssh

echo "Grant vagrant user sudo permissions without prompting for a password"
sudo groupadd admin
sudo usermod -G admin vagrant
sudo cp /etc/sudoers /etc/sudoers.orig
sudo sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
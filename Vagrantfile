# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "ubuntu" do |ub|
    ub.vm.box = "ubuntu/bionic64"
    ub.vm.hostname = "ubuntu-base"
    ub.vm.network "public_network"
  end

  config.vm.define "ubuntu-network" do |un|
      un.vm.box = "ubuntu/bionic64"
      un.vm.hostname = "ubuntu"
      un.vm.network :private_network, ip: "10.11.12.13"
      un.vm.network "forwarded_port", guest: 5000, host:5000
  end

  config.vm.define "databases" do |db|
      db.vm.box = "ubuntu/bionic64"
      db.vm.hostname = "databases"
      db.vm.network "public_network"
      db.vm.provision "shell", path: "provision/databases.sh"
  end

  config.vm.define "gcloud" do |gc|
      gc.vm.box = "ubuntu/bionic64"
      gc.vm.hostname = "gcloud-box"
      gc.vm.provision "shell", path: "provision/gcloud.sh"
  end

  config.vm.define "docker" do |dc|
      dc.vm.box = "ubuntu/focal64"
      dc.vm.hostname = "docker"
      dc.vm.provision "shell", path: "provision/docker.sh"
  end

  config.vm.define "freebsd" do |fb|
      fb.vm.box = "freebsd/FreeBSD-11.4-RELEASE"
      fb.vm.hostname = "freebsd"
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "ubuntu_chef" do |d|
      d.vm.box = "ubuntu/trusty64"
      d.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
      d.vm.hostname = "NAME"
      d.vm.synced_folder ".", "/vagrant"
      d.vm.network "forwarded_port", guest: 3000, host: 13000
 
      # Chef config only for dev
      d.vm.provision "chef_client" do |chef|
          chef.chef_server_url = "https://chef.example.com"
          chef.node_name = "NODE_NAME"
          chef.validation_key_path = "/path/to/chef.pem"
          chef.validation_client_name = "USER"
          chef.environment = "development" # Or any other env
 
          # Run list
          chef.add_role = "development"
      end
  end
 
  config.vm.define "ubuntu-gluster" do |m|
      m.vm.box = "ubuntu/trusty64"
      m.vm.hostname = "ubuntu-glusterfs"
      m.vm.network "public_network"
      #m.vm.provision "shell", path: "/path/to/script.sh"
  end
 
  config.vm.define "ubuntu" do |s|
      s.vm.box = "ubuntu/trusty64"
      s.vm.hostname = "ubuntu"
      s.vm.network :private_network, ip: "10.11.12.13"
      s.vm.network "forwarded_port", guest: 5240, host:5240
  end

  config.vm.define "chef-server" do |c|
    c.vm.box = "ubuntu/trusty64"
    c.vm.hostname = "chef-server"
    c.vm.network "public_network"
    c.vm.provision "shell", path: "provision/chef_server.sh"
  end

  config.vm.define "jessie" do |j|
    j.vm.box = "debian/jessie64"
    j.vm.hostname = "debian"
    j.vm.network "public_network"
  end

  config.vm.define "jessie-client" do |jc|
    jc.vm.box = "debian/jessie64"
    jc.vm.hostname = "jessie"
    jc.vm.network "public_network"
  end

  config.vm.define "ubuntu-nodejs" do |n|
    n.vm.box = "ubuntu/xenial64"
    n.vm.hostname = "ubuntu-nodejs"
    n.vm.provision "shell", path: "provision/nodejs.sh"
    n.vm.network :private_network, ip: "1.2.3.4"
    n.vm.network "forwarded_port", guest: 8080, host:8080
    n.vm.synced_folder "~/Code", "/vagrant"
  end

  config.vm.define "ubuntu-postgresql-0" do |pg0|
    pg0.vm.box = "ubuntu/xenial64"
    pg0.vm.hostname = "ubuntu-postgresql-0"
    pg0.vm.network "public_network"
    pg0.vm.provision "shell", path: "provision/postgresql.sh"
  end
 
  config.vm.define "ubuntu-postgresql-1" do |pg1|
    pg1.vm.box = "ubuntu/xenial64"
    pg1.vm.hostname = "ubuntu-postgresql-1"
    pg1.vm.network "public_network"
    pg1.vm.provision "shell", path: "provision/postgresql.sh"
  end
 
end

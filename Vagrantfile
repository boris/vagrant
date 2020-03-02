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

  config.vm.define "ubuntu-base" do |ub|
    ub.vm.box = "ubuntu/xenial64"
    ub.vm.hostname = "ubuntu-base"
    ub.vm.network "public_network"
  end
 
  config.vm.define "ubuntu" do |s|
      s.vm.box = "ubuntu/xenial64"
      s.vm.hostname = "ubuntu"
      s.vm.network :private_network, ip: "10.11.12.13"
      s.vm.network "forwarded_port", guest: 5000, host:5000
  end

  config.vm.define "chef-server" do |c|
    c.vm.box = "ubuntu/trusty64"
    c.vm.hostname = "chef-server"
    c.vm.network "public_network"
    c.vm.provision "shell", path: "provision/chef_server.sh"
  end

  config.vm.define "ubuntu-nodejs" do |n|
    n.vm.box = "ubuntu/xenial64"
    n.vm.hostname = "ubuntu-nodejs"
    n.vm.provision "shell", path: "provision/nodejs.sh"
    n.vm.network :private_network, ip: "1.2.3.4"
    #n.vm.network "forwarded_port", guest: 8080, host:8080
    n.vm.synced_folder "~/Code", "/vagrant"
  end

  config.vm.define "ubuntu-postgresql-0" do |pg0|
    pg0.vm.box = "ubuntu/xenial64"
    pg0.vm.hostname = "ubuntu-postgresql-0"
    pg0.vm.network "public_network"
    pg0.vm.provision "shell", path: "provision/postgresql.sh"
    pg0.vm.network "forwarded_port", guest: 5432, host:15432
  end
 
  config.vm.define "ubuntu-postgresql-1" do |pg1|
    pg1.vm.box = "ubuntu/xenial64"
    pg1.vm.hostname = "ubuntu-postgresql-1"
    pg1.vm.network "public_network"
    pg1.vm.provision "shell", path: "provision/postgresql.sh"
  end

  config.vm.define "databases" do |db|
      db.vm.box = "ubuntu/bionic64"
      db.vm.hostname = "databases"
      db.vm.network "public_network"
      db.vm.provision "shell", path: "provision/databases.sh"
  end
end

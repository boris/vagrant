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
 
  config.vm.define "ubuntu" do |m|
      m.vm.box = "ubuntu/trusty64"
      m.vm.hostname = "ubuntu"
      m.vm.provision "shell", path: "/path/to/script.sh"
  end
 
  config.vm.define "arch" do |s|
      s.vm.box = "arch64_2013"
      s.vm.hostname = "arch"
  end
 
end

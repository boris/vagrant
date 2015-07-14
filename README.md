# Vagrantfile

## Setup
```bash
$ git clone git@github.com:boris/vagrant.git
$ cd vagrant
$ vagrant status
Current machine states:

instance0                 not created (virtualbox)
instance1                 not created (virtualbox)
instance2                 not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
$ vagarnt up instance2
```

## Provision
This Vagrantfile contains the configuration for three different instances, each
of them provisioned with different methods.

The first one `instance0` is provisioned using `chef_client`. To use this
provision method, modify the following variables:

- `chef.chef_server_url`
- `chef.node_name`: the name your instance will send to chef server
- `chef.validation_key_path`: where your `.pem` key is
- `chef.validation_client_name`: the used associated to your `.pem` key.

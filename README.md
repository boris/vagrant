# Vagrantfile
This Vagrantfile contains the configuration for three different instances, each
of them provisioned with different methods.

The first one `instance0` is provisioned using `chef_client`. To use this
provision method, modify the following variables:

- `chef.chef_server_url`
- `chef.node_name`: the name your instance will send to chef server
- `chef.validation_key_path`: where your `.pem` key is
- `chef.validation_client_name`: the used associated to your `.pem` key.

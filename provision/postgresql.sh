#!/bin/bash
apt update
apt install postgresql etcd haproxy libyaml python
easy_install pip
pip install psycopg2 pyyaml
git clone git@github.com:zalando/patroni.git /home/vagrant/patroni


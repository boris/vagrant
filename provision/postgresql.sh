#!/bin/bash
add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt update
apt install -y etcd haproxy libyaml-0-2 python-pip postgresql-9.6
pip install psycopg2 pyyaml
git clone https://github.com/zalando/patroni.git /home/ubuntu/patroni


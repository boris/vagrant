#!/bin/bash
code='/home/ubuntu/postgres_cluster'
apt-get update
apt-get install -y build-essential libreadline-dev bison flex zlib1g-dev
git clone https://github.com/postgrespro/postgres_cluster.git $code
cd $code ; ./configure && make && make -j4 install
cd contrib/mmts && make install

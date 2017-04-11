#!/bin/bash
set -e

apt update

echo -e "=> Installing dependencies"
apt install -y build-essential python-minimal

echo -e "=> Getting latest code"
wget -P /tmp https://nodejs.org/dist/v6.10.2/node-v6.10.2.tar.gz
tar zxf node-v6.10.2.tar.gz
cd node-v6.10.2
./configure
make && sudo make install

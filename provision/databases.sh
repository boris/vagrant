#!/bin/bash
set -e

sudo apt-get update
sudo apt-get upgrade -y

echo "=> Installing MySQL client"
sudo apt-get install -y mysql-client

echo "=> Installing PostgreSQL client"
sudo apt-get install -y pgcli

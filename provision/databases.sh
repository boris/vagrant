#!/bin/bash
set -e

sudo apt-get update
sudo apt-get upgrade -y

echo "=> Installing MySQL client"
sudo apt-get install -y mysql-client

echo "=> Installing PostgreSQL client"
sudo apt-get install -y postgresql-client-common postgresql-client-10

echo "=> Adding custom prompts"
echo "\set PROMPT1 '%n@%/%R%#%x '" > /home/vagrant/.psqlrc

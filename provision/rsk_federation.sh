#!/bin/bash
set -x

download(){
    wget https://bitcoin.org/bin/bitcoin-core-0.16.0/SHA256SUMS.asc
    wget https://bitcoin.org/bin/bitcoin-core-0.16.0/bitcoin-0.16.0-x86_64-linux-gnu.tar.gz
}
verify(){
    gpg --keyserver keys.gnupg.net --recv-keys 90C8019E36C2E964
    gpg --finger 90C8019E36C2E964
    gpg --verify SHA256SUMS.asc 
    sha256sum --check --ignore-missing SHA256SUMS.asc
}

extract(){
    tar zxf bitcoin-0.16.0-x86_64-linux-gnu.tar.gz
}

configure(){
    sudo useradd -r -s /bin/false bitcoin
    sudo cp bitcoin-0.16.0/bin/bitcoind /usr/bin/
    sudo mkdir /etc/bitcoin
    sudo cp config/bitcoind.service /lib/systemd/system
    sudo cp config/bitcoin.conf /etc/bitcoin
    systemctl daemon-reload
    systemctl start bitcoind
    systemctl enable bitcoind
}

rskConfig(){
    sudo groupadd rsk
    sudo useradd rsk --shell=/bin/false --no-create-home -g rsk
    sudo mkdir /etc/rsk /var/lib/rsk/ /var/log/rsk/ /usr/share/rsk/
    sudo chown rsk. /var/lib/rsk /var/log/rsk
}

run(){
    download
    verify
    extract
    configure
}

run

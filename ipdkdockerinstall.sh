#!/bin/bash

git clone https://github.com/ipdk-io/ipdk

cd ipdk/build

./ipdk install
export PATH=/home/ad/ipdk/build:$PATH

ipdk install ubuntu2004

systemctl daemon-reload

systemctl restart docker

ipdk build --no-cache

sudo chmod 777 /var/run/docker.sock
sudo chown ${USER}:docker /var/run/docker.sock

ipdk start -d

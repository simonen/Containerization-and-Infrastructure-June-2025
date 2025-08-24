#!/bin/bash

if [ -d "/home/vagrant/bgapp-homework" ]; then
  echo "Directory exist, purging..."
  sudo rm -rf /home/vagrant/bgapp-homework
fi

echo "Cloning repository..."
git clone https://github.com/simonen/bgapp-homework.git

chown -R vagrant:vagrant /home/vagrant/bgapp-homework
cd bgapp-homework

sudo rm -rf .git

docker build -t web-image -f Dockerfile.web .
docker build -t db-image -f Dockerfile.db .
docker build -t php-image -f Dockerfile.fpm .

#!/bin/bash

if [ -d "/home/vagrant/bgapp-homework" ]; then
  echo "Directory exist, purging..."
  sudo rm -rf /home/vagrant/bgapp-homework
fi

#echo "Cloning repository..."
#git clone https://github.com/simonen/bgapp-homework.git

mkdir -v /home/vagrant/bgapp-homework
cp -r -v /app/. /home/vagrant/bgapp-homework

chown -R vagrant:vagrant /home/vagrant/bgapp-homework
cd bgapp-homework

#sudo rm -rf .git

# Stop and delete container and images

docker stop $(docker ps -q) || true
docker rmi -f $(docker images -q) || true

docker build -t web-image -f Dockerfile.web .
docker build -t db-image -f Dockerfile.db .
docker build -t php-image -f Dockerfile.fpm .

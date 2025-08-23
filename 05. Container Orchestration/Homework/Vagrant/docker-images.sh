#!/bin/bash

if [ ! -d "/path/to/dir" ]; then
  echo "Directory does not exist, running command..."
  git clone https://github.com/simonen/bgapp-homework.git
else
  echo "Directory exists, skipping."
fi

cd bgapp-homework
echo "DB_ROOT_PASSWORD=12345" > .env

docker build -t web-image -f Dockerfile.web .
docker build -t db-image -f Dockerfile.db .
docker build -t php-image -f Dockerfile.fpm .

#docker secret create db_root_pass .env

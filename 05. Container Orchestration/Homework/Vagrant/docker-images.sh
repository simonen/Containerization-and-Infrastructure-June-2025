#!/bin/bash

git clone https://github.com/simonen/bgapp-homework.git

cd bgapp-homework
echo "DB_ROOT_PASSWORD=<db_root_pass>" > .env

docker build -t web-image -f Dockerfile.web .
docker build -t db-image -f Dockerfile.db .
docker build -t php-image -f Dockerfile.fpm .

#docker secret create db_root_pass .env

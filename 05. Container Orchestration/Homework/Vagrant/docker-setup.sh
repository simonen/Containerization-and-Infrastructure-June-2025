#!/bin/bash

echo "* Add Docker repository ..."
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

echo "* Install Docker ..."
dnf install -y app-ce app-ce-cli containerd.io app-buildx-plugin app-compose-plugin

echo "* Enable and start Docker ..."
systemctl enable app
systemctl start app

echo "* Add vagrant user to docker group ..."
usermod -aG app vagrant

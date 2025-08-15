#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 docker.do1.lab docker" >> /etc/hosts

echo "* Install Additional Packages ..."
dnf install -y jq tree git nano

echo "* Firewall - open port 8080 ..."
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --reload

echo "PS1='\[\e[0;32m\][\u@\h \W]\$ \[\e[m\]'" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
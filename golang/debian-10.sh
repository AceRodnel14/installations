#!/bin/bash

# Used on Debian WSL Machine
# Debian OS 10
# Kernel Version: 4.19.128-microsoft-standard

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install wget

wget https://golang.org/dl/go1.16.3.linux-armv6l.tar.gz
tar -C /usr/local -xzf go1.16.3.linux-armv6l.tar.gz
echo -e "\nexport PATH=$PATH:/usr/local/go/bin\n" >> /etc/profile
source /etc/profile
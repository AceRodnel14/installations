#!/bin/bash

# Used on RPi 4
# Raspberry Pi OS 10
# Kernel Version: 5.10.17

# Used on RPi 3B
# Raspberry Pi OS 10
# Kernel Version: 5.4.72

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install wget

rm -rf /usr/local/go
wget https://golang.org/dl/go1.16.4.linux-armv6l.tar.gz
tar -C /usr/local -xzf go1.16.4.linux-armv6l.tar.gz
echo -e "\nexport PATH=$PATH:/usr/local/go/bin\n" >> /etc/profile
source /etc/profile
sudo ln -s /usr/local/go/bin/go /usr/bin/go
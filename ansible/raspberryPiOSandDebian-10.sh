#!/bin/bash

# Used on RPi 4
# Raspberry Pi OS 10
# Kernel Version: 5.10.17

# Used on Debian WSL Machine
# Debian OS 10
# Kernel Version: 4.19.128-microsoft-standard

sudo bash -c "echo \"deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main\" >> /etc/apt/sources.list"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

sudo apt update

sudo apt -y install ansible
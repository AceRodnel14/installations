#!/bin/bash

# Used on RPi 4
# Raspberry Pi OS 10
# Kernel Version: 5.10.17

# Used on RPi 3B
# Raspberry Pi OS 10
# Kernel Version: 5.4.72

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install curl

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi

#!/bin/bash

# Used on RPi 4
# Raspberry Pi OS 10
# Kernel Version: 5.10.17

# Used on RPi 3B
# Raspberry Pi OS 10
# Kernel Version: 5.4.72

../docker/raspberryPiOS-10.sh

apt-get -y install libffi-dev libssl-dev python3 python3-pip --fix-missing
apt-get remove python-configparser 
pip3 -v install docker-compose
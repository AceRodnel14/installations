#!/bin/bash

# Tested on RPi 4
# Raspberry Pi OS 10
# Kernel Version: 5.10.17

sudo apt-get update && sudo apt-get -y upgrade

sudo apt-get -y hostapd
sudo systemctl unmask hostapd && sudo systemctl enable hostapd

sudo $(which bash) -c "echo -e \"\
[NetDev]\n\
Name=br0\n\
Kind=bridge\
\" > /etc/systemd/network/bridge-br0.netdev"

sudo $(which bash) -c "echo -e \"\
[Match]\n\
Name=eth0\n\
\n\
[Network]\n\
Bridge=br0\
\" > /etc/systemd/network/br0-member-eth0.network"

sudo systemctl enable systemd-networkd

sudo sed -i '1s/^/denyinterfaces wlan0 eth0\n/' /etc/dhcpcd.conf
sudo sed -i '$s/$/\ninterface br0\n/' /etc/dhcpcd.conf

sudo rfkill unblock wlan

sudo $(which bash) -c "echo -e \"\
country_code=GB\n\
interface=wlan0\n\
bridge=br0\n\
ssid=TestNetwork\n\
hw_mode=g\n\
channel=7\n\
macaddr_acl=0\n\
auth_algs=1\n\
ignore_broadcast_ssid=0\n\
wpa=2\n\
wpa_passphrase=PasswordSample\n\
wpa_key_mgmt=WPA-PSK\n\
wpa_pairwise=TKIP\n\
rsn_pairwise=CCMP\
\" > /etc/hostapd/hostapd.conf"

if [ ! $(which docker) ]
then
    echo "Docker is present"
    sudo iptables -A FORWARD -i br-inet -j ACCEPT
    sudo iptables-save > /etc/iptables/iptables/rules.v4
    sudo ip6tables-save > /etc/iptables/iptables/rules.v6
    sudo sed -i '/^exit 0/s/^/\
    \/usr\/sbin\/iptables-restore < \/etc\/iptables\/iptables\/rules.v4\n/' txt.txt
    sudo sed -i '/^exit 0/s/^/\
    \/usr\/sbin\/iptables-restore < \/etc\/iptables\/iptables\/rules.v4\
    \/usr\/sbin\/ip6tables-restore < \/etc\/iptables\/iptables\/rules.v6\n\n/' /etc/rc.local
fi

sudo systemctl reboot
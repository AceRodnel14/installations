# Installation of hostapd
---
The Shell script in this folder will configure RaspberryPi to work as an Access Point.
It has been tested to run on RaspberryPi 32bit. It will create a **new WiFi Access**
**Point without isolating the RaspberryPi Access Point network**.

Another added part in this script is **Docker checking**. If the RaspberryPi is already
with Docker, it will **need to configure the IPtables**. To make **iptables config persistent**,
2 lines of commands will be added to rc.local(**file that runs commands @startup**)

**Sample topology:**

Home Router (192.168.33.1) <----> RaspberryPi (192.168.3.115) <----> NodeMCU (192.168.3.17)

*In this setup, since they are in the same network, the WebServer in NodeMCU is* 
*reachable by all devices connected to the Home Router. This is because* 
*there is no NAT configuration.*

**Instructions:**
1. Download this folder or just copy the contents of the Shell script.
2. After editing the SSID and WPA passphrase, please run the command below to get started.
   > bash \<RaspberryPiOS-32bit.sh or the name of the saved file\>

**Note:**
- Please edit the the SSID part (**line 37**) and WPA passphrase (**line 44**).
   *I recommend using SSID different from home WiFi router because this is not*
   *a WiFi extender.*

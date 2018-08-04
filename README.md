BYU Library Photogrammetry
==========================

Brigham Young University - Photogrammetry Project

Overview
--------

The structure consists of a control box and a number of nodes.
File transfer is managed by a combination of usb and an internal network.
There is universal 5v, focus, shutter, and ground lines.

### Control

The control box will mainly be powered by a raspberry pi 3 b+.
Along with the raspberry pi, there is a display and buttons for easy managment and a network switch for connecting all of the pis.

### Node

Each node consists of up to six cameras, a raspberry pi brain, a usb hub to connect all the cameras, and a focus/shutter control board.
Each node networks back to the control box.

Setting up DHCP for the Control
-------------------------------

The control box will run a DHCP server to allow network communication from the node to itself.
Install dnsmasq

```
sudo apt install dnsmasq
```

Edit `/etc/network/interfaces` - This should be the whole file:

```
auto eth0
iface eth0 inet static
address 192.168.1.1
netmask 255.255.255.0
```

Edit `/etc/dnsmasq.conf` - This should be the whole file:

```
interface=eth0
dhcp-range=192.168.1.2,192.168.1.254,255.255.255.0,12h
```

Creating A Ramdisk
------------------

Constantly writing photos to and from the raspberry pis SD card will not be very good for the lifespan of the card.
It is a better idea to instead dedicate an chunck of ram, since it isn't likely to burn out.

Make the `/pictures` directory.
Add this line to `/etc/fstab`:

```
tmpfs /pictures tmpfs defaults,noatime,nosuid,mode=0777,size=100m 0 0
```

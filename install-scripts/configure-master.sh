#!/bin/bash
if [[ $(id -u) -ne 0 ]]
then 
    echo "Please run as root" 
else
    echo Installing dnsmasq
    apt-get install dnsmasq -y > /dev/null 2>&1

    echo Setting up dnsmasq
    cat << EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
address 192.168.1.1
netmask 255.255.255.0
EOF
    cat << EOF > /etc/dnsmasq.conf
interface=eth0
dhcp-range=192.168.1.2,192.168.1.254,255.255.255.0,12h
EOF

    echo Creating /network
    echo "tmpfs /network tmpfs defaults,noatime,nosuid,mode=0777,size=100m 0 0" >> /etc/fstab
    mount -a

    echo Installing scripts
    echo FINISH SCRIPTS FIRST!
fi


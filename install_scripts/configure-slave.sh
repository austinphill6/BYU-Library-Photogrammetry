#!/bin/bash
if [[ $(id -u) -ne 0 ]]
then 
    echo "Please run as root" 
else
    echo Installing gphoto2
    apt-get install gphoto2 -y > /dev/null 2>&1

    echo Creating /pictures
    echo "tmpfs /pictures tmpfs defaults,noatime,nosuid,mode=0777,size=100m 0 0" >> /etc/fstab
    mount -a

    echo Labeling master
    echo "192.168.1.1   master" >> /etc/hosts

    echo Installing scripts
    echo FINISH SCRIPTS FIRST!
fi


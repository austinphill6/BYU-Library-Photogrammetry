#!/bin/bash

folder=`date "+%Y-%m-%d_%T"`

cd /photos

echo Making directory: $folder
mkdir $folder
cd $folder

declare -a camera_array
declare -a camera_storage_array

counter=0
IFS=$'\n'
for result in `gphoto2 --auto-detect -q | grep 'Nikon\|DSC\|D300'`
do
    camera_array[$counter]=$result
    ((counter++))
done

counter=0
for j in "${camera_array[@]}"
do
    camera_array[$counter]=`echo $j | cut -d ":" -f 2-`
    ((counter++))
done

for j in "${camera_array[@]}"
do
    echo Importing photos from camera $j
    gphoto2 --port=usb:$j -P -q
done

counter=0
for j in "${camera_array[@]}"
do
    camera_storage_array[$counter]=`gphoto2 --port=usb:$j -L | grep '/store_00010001/DCIM/' | cut -d "/" -f 4 | cut -d "'" -f 1`
    ((counter++))
done

counter=0
for j in "${camera_array[@]}"
do
    echo Deleting photos from camera $j
    gphoto2 --port=usb:$j -f "/store_00010001/DCIM/${camera_storage_array[$counter]}" -D -q
    ((counter++))
done

rsync -a /photos/ master:/network/$(ip a | grep 192.168.1. | cut -d '.' -f 4 | cut -d '/' -f 1)

cd ~

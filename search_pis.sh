#!/bin/bash

for i in {2..30}
do
	RESULT=$(ping -c 1 -W 1 192.168.1.$i | grep rtt | cut -c -3)
	if [ "$RESULT" = "rtt" ]
	then
		mkdir /network/$i
	fi
done

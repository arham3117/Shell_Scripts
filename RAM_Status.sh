#!/bin/bash

<< comment
This shell script helps find the free space in RAM.

comment

Free_Space=$(free -mt | grep "Total" | awk '{print $4}')
Thershold=100

if [[ $Free_Space -lt $Thershold ]]
then
	echo "WARNING: RAM is running LOW !!!"

else
	echo "RAM Space is sufficient - $Free_Space MB"
fi


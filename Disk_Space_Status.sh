#!/bin/bash

<< comment
This script check free disk space and also send out alert emails.
comment

File_Utilization=$(df -H | egrep -v "Filesystem|tmpfs"| grep "xvda16" | awk '{print $5}' |tr -d %)

Email_To="xxyyzz@gmail.com"

if [[ $File_Utilization -ge 10 ]]
then
	echo "WARNING: Disk Space is LOW - $File_Utilization % !!!" | mail -s "Disk Space Alert !!!" $Email_To
       	
else
	echo "Disk Space looks good!"
fi

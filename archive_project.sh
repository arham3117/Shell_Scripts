#!/bin/bash

<< comment
This script checks if there is a file size greater than 4kb and if there exist such a file then it will create an archive directory and will compress the file and move it to archive directory.
comment


Base_Path=/home/ubuntu/shell_scripts
Days=10
Depth=1
Run=0

#Check if the directory is present or not.

if [ ! -d $Base_Path ]
then
	echo "The directory does not exist: $Base_Path"
	exit 1
fi

#Create 'Archive' folder if not present

if [ ! -d $Base_Path/archive ]
then
	mkdir $Base_Path/archive
fi

#Find the list of files larger than 4 kb

for i in $(find "$Base_Path" -maxdepth "$Depth" -type f -size +1k);
do 

	if [ "$Run" -eq 0 ]
	then 
		echo "[$(date "+%Y -%m -%d -%H:%M:%S")] archiving $i ==> $Base_Path/archive"
		gzip "$i" || exit 1
		mv "$i.gz" "$Base_Path/archive" || exit 1
		
	fi

done

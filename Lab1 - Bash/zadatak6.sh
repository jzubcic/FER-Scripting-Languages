#!/bin/bash

dir1=$1 
dir2=$2 

if [ ! -d "$dir1" -o ! -d "$dir2" ]; then
	echo "Neispravno zadani argumenti, navedite postojeće direktorije kao argumente pri pokretanju."
	exit 
fi

check_dir () {
	for file in $(ls $1)
	do 
	if [ -f "$2/$file" ]; then
		if [ "$1/$file" -nt "$2/$file" ]; then
			echo "$1/$file --> $2"
		fi
	else 
		echo "$1/$file --> $2"
	fi
	done 
}

check_dir $1 $2 
check_dir $2 $1


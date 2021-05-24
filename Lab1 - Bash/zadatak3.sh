#!/bin/bash

ime_direktorija=$1

for log_file in $(ls $ime_direktorija)
do
	datum=$(echo $log_file | grep -oE "[0-9]{4}\-[0-9]{2}\-[0-9]{2}")
	dan=$(echo $datum | cut -d '-' -f 3)
	mjesec=$(echo $datum | cut -d '-' -f 2)
	godina=$(echo $datum | cut -d '-' -f 1)
	echo "datum: $dan-$mjesec-$godina"
	echo --------------------------------------------------
	
	grep -oE "\"(.*)\"" $log_file | sed 's/\"//g' | sort | uniq -c | sort -nr
done

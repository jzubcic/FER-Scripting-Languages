#!/bin/bash

zadani_direktorij=$1

if [ ! -d "$zadani_direktorij" ]; then
	echo "Direktorij $zadani_direktorij ne postoji, navedite postojeći direktorij kao argument pri pokretanju."
	exit 
fi

trenutni_mjesec=0 
slika_u_mjesecu=0
for slika in $(ls $zadani_direktorij) 
do
	mjesec_slike=$(echo $slika | cut -c5-6)
	mjesec_slike+="-"
	mjesec_slike+=$(echo $slika | cut -c1-4)
	
	if [ "$trenutni_mjesec" != "$mjesec_slike" ] 
	then
		# dovrsi prethodni blok (osim za prvu iteraciju) 
		if test "$trenutni_mjesec" != 0 ; then 
			echo "--- Ukupno: $slika_u_mjesecu slika ----"
			echo
		fi 
		# zapocni novi
		trenutni_mjesec="$mjesec_slike"
		echo "$trenutni_mjesec :"
		echo "----------"
		slika_u_mjesecu=1
	else 
		slika_u_mjesecu=$((slika_u_mjesecu + 1))
	fi
	echo "  $slika_u_mjesecu. $slika"
		
done
echo "--- Ukupno: $slika_u_mjesecu slika ----"

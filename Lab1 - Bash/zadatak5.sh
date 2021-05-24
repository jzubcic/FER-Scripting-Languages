#!/bin/bash

zadani_direktorij=$1
oblik=$2

# ako zelimo naci sve s nekim nastavkom predajemo \*.sh
echo "Argumenti su: $zadani_direktorij i $oblik" 

broj_redaka=$(find $zadani_direktorij -name "$oblik" -exec wc -l {} + )

# prebroji fileove tako da izbrojis rijeci, ako je samo jedan file ispis ce bit <broj rijeci> <ime filea>, tj. dvije rijeci
broj_fileova=$(echo $broj_redaka | wc -w) 

# ako postoji samo jedan file
if [ "$broj_fileova" == 2 ] ; then
	echo "tu sam"	broj_redaka=$(echo $broj_redaka | grep -oE "[0-9]+") 
else 
	# vise fileova
	broj_redaka=$(echo $broj_redaka | grep -oE "[0-9]+ total" | grep -oE "[0-9]+")
fi

echo "Ukupan broj redaka u datotekama s oblikom $oblik je $broj_redaka"

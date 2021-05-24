#!/usr/bin/perl

print "Upisite brojeve (x za kraj): \n";
 
chomp($unos = <STDIN>); 

@list = ( );  
while ($unos ne "x") {
	push @list, $unos;
	chomp($unos = <STDIN>); 
}

$suma = 0; 
foreach $number (@list) {
	$suma += $number;
}

$sredina = $suma / @list; 
print "Aritmeticka sredina je $sredina \n"

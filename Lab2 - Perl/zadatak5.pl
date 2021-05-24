#!/usr/bin/perl

use warnings; 

my @values; 
$prvi = 1; 
my $studenti_bodovi = {}; 
while (defined($redak = <>)) {
	chomp($redak); 
	if ( $redak =~ /^#/) {
		# komentar 
	} else {
		# provjera za prvi redak
		if ( $prvi == 1 ) {
			# napuni vrijednosti komponenta
			@values = split(";", $redak);
			$prvi = 0;  
		} else {
			if ( $redak =~ /(\d+);([[:alpha:]]+);([[:alpha:]]+);(.+)/ ) {
				$student = "$2, $3 ($1)"; # Prezime, Ime (JMBAG)
				my @komponente = split(';', $4); 
				for my $i (0 .. $#komponente) {
					if ( $komponente[$i] ne "-" ) {
						$studenti_bodovi{$student} += $komponente[$i] * $values[$i];
					} 
				}
			}
		}
	}
}

print "Lista po rangu:\n"; 
print "-------------------\n";
$rang = 1; 
my @keys = sort { $studenti_bodovi{$b} <=> $studenti_bodovi{$a} } keys %studenti_bodovi; 
foreach my $student (@keys) {
	print "$rang. $student : $studenti_bodovi{$student}\n"; 
	$rang += 1; 
}

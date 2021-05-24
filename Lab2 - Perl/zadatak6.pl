#!/usr/bin/perl
use open ':locale'; 
use locale; 


# procitati duljinu prefiksa iz argumenta
$duljina_prefiksa = $ARGV[-1]; 
my $hash = {};

while (defined($redak = <>)) {
	chomp($redak); 
	for (split ' ', $redak) {
		if ( /(.{$duljina_prefiksa})/i ) {
			$hash{lc $1}++;
		}
	}
}

foreach my $prefiks (sort keys %hash) {
	print "$prefiks : $hash{$prefiks}\n"; 
}


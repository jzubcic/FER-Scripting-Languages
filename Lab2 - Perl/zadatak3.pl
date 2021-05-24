#!/usr/bin/perl

$trenutni = ""; 
my $hash = {};

while (defined($redak = <>)) {
	
	if ($trenutni ne $ARGV) {
		foreach my $name (sort keys %hash) {
			print "$name : $hash{$name}\n"; 
		}
		# izvuci datum iz imena datoteke i printaj ga
		if ( $ARGV =~ /(\d{4}-\d{2}-\d{2})/) {		
			print ("Datum: $1 \n");
			print ("sat : broj pristupa\n");
			print ("-------------------------------\n");
		}
		$trenutni = $ARGV; 
		# isprazni dictionary
		%{$hash} = ()
	}
	chomp($redak); 
	
	if ( $redak =~ /:(\d{2}):\d{2}:\d{2}/) {
		$hash{$1}++;
	}
}

foreach my $name (sort keys %hash) {
	print "$name : $hash{$name}\n"; 
}

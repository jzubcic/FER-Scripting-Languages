#!/usr/bin/perl

while (defined($redak = <>)) {
	chomp($redak); 
	# $1 = datum termina, $2 = vrijeme termina, $3 = datum predaje, $4 = vrijeme predaje
	if ( $redak =~ /(\d{4}-\d{2}-\d{2})\s(\d{2}):\d{2}.*;(\d{4}-\d{2}-\d{2})\s(\d{2}):\d{2}/ ) {
		# print "1 je $1, 2 je $2, 3 je $3, 4 je $4\n"; 
		if ( $1 ne $3 or $2 ne $4) {
			if ( $redak =~ /(\d{10});(\w+);(\w+);(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}).*;(.*)/ ) {
				print ("$1 $2 $3 - PROBLEM: $4 --> $5\n");
			}
		} 
	}
}

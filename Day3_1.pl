#! /usr/bin/perl

use warnings;
use strict;

open(FH, '<', '/media/win_omega/Projekte/adventofcode/babyRucksack.csv');
#open(FH, '<', '/media/win_omega/Projekte/adventofcode/Rucksack.csv');

my %prio = (
	'a' => 1,
	'b' => 2,
	'c' => 3,
	'd' => 4,
	'e' => 5,
	'f' => 6,
	'g' => 7,
	'h' => 8,
	'i' => 9,
	'j' => 10,
	'k' => 11,
	'l' => 12,
	'm' => 13,
	'n' => 14,
	'o' => 15,
	'p' => 16,
	'q' => 17,
	'r' => 18,
	's' => 19,
	't' => 20,
	'u' => 21,
	'v' => 22,
	'w' => 23,
	'x' => 24,
	'y' => 25,
	'z' => 26,
	'A' => 27,
	'B' => 28,
	'C' => 29,
	'D' => 30,
	'E' => 31,
	'F' => 32,
	'G' => 33,
	'H' => 34,
	'I' => 35,
	'J' => 36,
	'K' => 37,
	'L' => 38,
	'M' => 39,
	'N' => 40,
	'O' => 41,
	'P' => 42,
	'Q' => 43,
	'R' => 44,
	'S' => 45,
	'T' => 46,
	'U' => 47,
	'V' => 48,
	'W' => 49,
	'X' => 50,
	'Y' => 51,
	'Z' => 52,
);

my @wrongitems;
my $prio = 0;

while(<FH>){
	chomp;
	my %ItemCounter;
	my $line = $_;
	print $line."\n";

	# split rucksack into half
	my $comlength = int(length($line)/2);
	print $comlength."\n";

	my @compartement;
	@compartement[0] = substr($line, 0, $comlength);
	@compartement[1] = substr($line, $comlength, $comlength);
	my @sub1 = split //, $compartement[0];
	my @sub2 = split //, $compartement[1];
	print @compartement[0]." -- ".@compartement[1]."\n";

	# remember items
	foreach (@sub1) {
		#print $_."\n";
		my $item = $_;
		if (grep /$item/, $compartement[1]) { 
			#print "found: ".$item."\n";
			$ItemCounter{$item}++;			
		} else {
			#print "wrong? ".$item."\n";
		}
	}
	foreach (@sub2) {
		#print $_."\n";
		my $item = $_;
		if (grep /$item/, $compartement[0]) { 
			#print "found 2: ".$item."\n";	
			$ItemCounter{$item}++;					
		} else {
			#print "wrong 2? ".$item."\n";
		}
	}	
	while (my ($item, $v) = each %ItemCounter) {
	
		print "$item => $v\n";
		# get prio of double item
		my $tmpprio = $prio{$item};

		# sum up
		$prio = $prio + $tmpprio;			
	}
}

# print out result
print $prio."\n";

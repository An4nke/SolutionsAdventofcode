#! /usr/bin/perl

use warnings;
use strict;

#open(FH, '<', '/media/win_omega/Projekte/adventofcode/babyRucksack.csv');
open(FH, '<', '/media/win_omega/Projekte/adventofcode/Rucksack.csv');

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

my @bin;
my $pound = 0;
my $nr = 0;
my $badged = '';

while(<FH>){
	chomp;
	$nr++;
	if ($nr%3 == 0) {
		push @bin, $_;		
		#print $nr." ".($nr%3)."\n";
		
		## jede zeile splitten
		my @line1 = split //, $bin[0];
		my @line2 = split //, $bin[1];
		my @line3 = split //, $bin[2];
		
		## processing -> find item in each group
		foreach (@line1) {
			#print $_."\n";
			my $item = $_;
			if (grep /$item/, @line2 and grep /$item/, @line3) { 
				print "badged: ".$item."\n";
				$badged = $item;
			}
		}	
		# get score
		$pound = $pound + $prio{$badged};
		@bin = ();
	} else {
		push @bin, $_;
	}
}

# print out result
print $pound."\n";

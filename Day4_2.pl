#! /usr/bin/perl

use warnings;
use strict;

## programm call: cat *csv | perl Day4_1.pl

# variables
my $nrfull = 0;

# read csv from STDIN (pipe) containing pairs of elves and their id for cleaning up
while (<STDIN>) {
	#print $_;
	chomp;

	# split line into elves
	my @pair = split /,/, $_;
	#print $pair[0]." .. ".$pair[1]."\n";
	# get range of assigned ids
	my ($e1, $e2) = split /-/, $pair[0];
	my ($f1, $f2) = split /-/, $pair[1];	
	#print "range 1: ".$e1." - ".$e2."	range 2: ".$f1." - ".$f2."\n";

	# compare ranges
	# Overlapping ranges?
	if (($e1 <= $f1 and $e2 >= $f1)
		or ($f1 <= $e1 and $f2 >= $e1))
	{
		print "overlapping! ".$e1." = ".$e2." = ".$f1." = ".$f2."\n";
		$nrfull++;			
	}
}


# print pairs
print "$nrfull pairs are overlapping!\n";

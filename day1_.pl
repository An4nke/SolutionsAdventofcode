#! /usr/bin/perl

open(FH, '<', 'test1.csv') or die $!;

my $counter = 1;

while (<FH>)
{
   chomp;
   if ($_ =~/^$/) { 
	   $counter++;
	   next; 
	} else {
		print "$_,$counter\n";
	}
};

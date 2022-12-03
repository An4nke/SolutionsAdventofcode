#! /usr/bin/perl

open(FH, '<', '/media/win_omega/Projekte/adventofcode/test1.csv') or die $!;

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

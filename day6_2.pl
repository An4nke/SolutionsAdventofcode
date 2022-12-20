#! /usr/bin/perl

use warnings;
use strict;


## variables

# read from input from parameter
open(my $FH, '<', $ARGV[0]);

# read input from STDIN
while (<$FH>) {
	chomp;
	# datastream = line
	print "$_\n";
	my @line = split //, $_;
	#my $line_ref = \@line;
#	foreach (@$line_ref) {
#			print $_." -- ";
#	}	
	my $marker = find (\@line);

	# remember we count from 0.. so think about the offset..
	print "First start-of-messages marker detected at position: ".$marker."\n";
}


sub find {
	my $arr = shift;
	# we count from 0 so..	
	my $charNR = 0;
	my @chars;	
	# processing lines -> split into single characters	
	foreach (@$arr) {
		my $char = $_;
		#print "$charNR\t".$char."\n";
		
		# first 4 characters -> do nothing
		if ($charNR < 14) {
			#foreach (@chars) { print "$_";}
			#print "\n";
			$charNR++;	
			# remember characters
			push @chars, $char;					
			next;			
		}
		# processing characters
		my $cNR = 0;
		print "analysing seq for $char:\n";
		foreach (@chars) { print "$_";}
		print "\n";
		# new char in array		
		# double characters?
		#if (grep(/$char/, @chars)) {
			#return $charNR;
			#$cNR++;
		#}
		
		# doubletts?
		my %count;
		foreach (@chars) {
			$count{$_}++;
		}
		if (grep { $_ > 1 } values %count) {
			#print "doupletts in:\n";
			#foreach (@chars) { print "$_";}
			#print "\n";
			$cNR++;
		}
		
		if ($cNR == 0) {
			#print "Distinct: $charNR\n";
			#foreach (@chars) { print "$_";}
			#print "\n";
			return $charNR;
		}

		# remember characters
		push @chars, $char;
		
		# throw away left sided character
		my $rm = shift @chars;
		#print "$rm thrown away\n";		
		$charNR++;			
	}
}

close $FH;

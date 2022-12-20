#! /usr/bin/perl

use warnings;
use strict;

=input

    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2


=cut

## variables
# array of arrays
my @stacks;


# read from input from parameter
open(FH, '<', $ARGV[0]);

# process input
while(<FH>){
	#chomp;
	my $line = $_;
	if ($line =~m/\[/) {
		#print $line."\n";
		# clean input
		
		#my @offset = $line = ~/\[/g;
		#$line =~s/[\[\]]//g;
		#$line =~s/\s{3}//g;
		#print "$line\n";
		# offset!
		# split into line
		#my @line = split /\s/, $line;
		my @line = $line =~/(...).?/g;

		foreach (@line) {
				$_ =~s/\[(\w)\] ?/$1/g;
				$_ =~s/ ( )  ?/$1/g;	
				#print "$_";
		}
		#print "-".$line[0]."-".$line[1]."-".$line[2];
		#print "\n";
		# create array of array
		my $dim = 0;
		foreach (@line) {
			# skip empty fields	
			if ($_ =~/\s/) { 
				$dim++;
				next; 
			}
			#print $dim." - ".$_."\n"; 
		
			# ID of resulting array -> representing stack
			# save moredimensional array
			push @{ $stacks[$dim] }, $_;
			$dim++;
		}

	
	} elsif ($line =~/move\s+(\d+)\s+from\s+(\d+)\s+to\s+(\d+)/) {
		# get the movement
		# get movement input
		# move -> assign number of moves
		# from -> get stack = shift() -> move to other stack shift()
		my $times = $1;
		# don't forget we are counting from 0
		my $stack = $2 - 1;
		my $goal = $3 - 1;
		if ($times > @{ $stacks[$stack] }) {
			$times = @{ $stacks[$stack] };
		}
		while ($times > 0) {
			#print "rearranging $times times!\n";	
			# get element
			my $tmp = shift @{ $stacks[$stack] };
			#print "taken ".$tmp."\n";
			# rearrange
			unshift @{ $stacks[$goal] }, $tmp;
			#foreach (@{ $stacks[$stack] }) { print $_; }
			#print "\n";
			#foreach (@{ $stacks[$goal] }) { print $_; }
			#print "\n";
			$times--;
		}
	}
}

# get and print first elements of every stack
my $id = 0;
foreach (@stacks) {
	#print "$id ";
	print $stacks[$id][0];
	foreach (@{ $stacks[$id]}){ 
		#print $_;
		# first element = top element"
		}
  	$id++;
	#print "\n";
}
print "\n";

close $FH;

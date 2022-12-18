#! /usr/bin/perl

use warnings;
use strict;


## variables
# let us remeber all sizes
my %dirCont;

# we always have to know which dir we are inside
my @path;

# sizes
my $totalsize = 0;

## add for question 2
my $limit = 0;
my $minimum = 0;


# get input
# read from input from parameter
open(my $FH, '<', $ARGV[0]);

# read input from STDIN
# 1. Processing: find connection and size of files
while (<$FH>) {
	# now let us get the user input
	my $line = $_;
	#print "[RAW]\t$line\n";
	
	# What about the root dir?
	if ($line =~/^\$ cd \//) {
		# reset path array
		push @path, 'root';
	}	
	
	# change of dir
	if ($line =~/^\$ cd ([\w+]+)/) {
		my $tmp = $1;
		push @path, $tmp;
		#print "[CHANGE]\tgot into dir $path[-1]\n";				
	}	
	
	# find recursive dirs
	if ($line =~/^dir (\w+)/) {
		next;		
	}
	
	# go back
	if ($line =~/^\$ cd \.\./) {
		pop @path;			
	}
	
	# go further
	if ($line =~/(\d+)\s(.*)/) {	
		my $size = $1;
		my $file = $2;
		my $len = @path;
		# update size of all directorys of the path
		for my $id (0..$len-1) {
			my $path = join "/", @path[0..$id];
			$dirCont{$path} += $size;
		}
	}
}

## Answer Question 1
map { $dirCont{$_} <= 100000? $totalsize = $totalsize + $dirCont{$_}:  "" } keys %dirCont;
print "[RESULT]\ttotal size: ".$totalsize."\n";

## Answer Question 2
$limit = 30000000 - (70000000 - $dirCont{"root"});
foreach my $dir (sort keys %dirCont) {
	#print "$dir -- $dirCont{$dir}\n";
	## find dirs to delete for getting the necessary space
	if ($limit <= $dirCont{$dir}) {
		print "$dir -- $dirCont{$dir}\n";
		# find minimum 
		if ($minimum == 0) {
			$minimum = $dirCont{$dir};
		} elsif ($dirCont{$dir} < $minimum) {
			$minimum = $dirCont{$dir};
		}
	}
}


print "[RESULT]\tSize to delete: $minimum\n";


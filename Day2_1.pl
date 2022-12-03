#! /usr/bin/perl

use warnings;
use strict;

open(FH, '<', 'papersiccors.csv') or die $!;



=end
 X means you need to lose, 
 Y means you need to end the round in a draw, 
 and Z means you need to win.

A Y
1 3 = 4

B X
1 0

win

A -> B

B -> C

C -> A

draw

A X
B Y
C Z

loose
B	Z
C	Y
A	X

loose
B A
C B
A C


=cut

# scores for win
my %pkt = ('X' => 1,
		'Y' => 2,
		'Z' => 3);

# translate into same alphabet
my %win = ('A' => 'Y',
		'B' => 'Z',
		'C' => 'X'
	);
	
my %draw = ('A' => 'X',
		'B' => 'Y',
		'C' => 'Z'
	);	
	
my %loose = ('B' => 'Z',
		'C' => 'Y',
		'A' => 'X'
	);	

my $score = 0;

while (<FH>)
{
	#my $tmp = 0;
	#print $_;
	my @line = split /,/, $_;
	#print $win{$line[0]}." ".$line[1]."\n";
	if ($line[1] =~ $win{$line[0]}) {
		$score = $score + 6;
	} elsif ($line[1] =~ $draw{$line[0]}) {
		$score = $score + 3;
	} elsif ($line[1] =~ $loose{$line[0]}) {
		$score = $score + 0;
	};
	# C
	if ($line[1] =~/X/) {
		$score = $score + 1;
	# A
	} elsif ($line[1] =~/Y/) {
		$score = $score + 2;
	# B	
	} elsif ($line[1] =~/Z/) {
		$score = $score + 3;	
	};
};

print "Your Score: $score\n";

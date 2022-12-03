#! /usr/bin/perl

use warnings;
use strict;

open(FH, '<', 'papersiccors.csv') or die $!;
#open(FH, '<', 'baby.csv') or die $!;



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
	
my %loose = ('A' => 'Z',
		'B' => 'X',
		'C' => 'Y'
	);

my $score = 0;

while (<FH>)
{
	#my $tmp = 0;
	#print $_;
	my @line = split /,/, $_;
	#print $win{$line[0]}." ".$line[1]."\n";
	if ($line[1] =~/X/) {
		# you have to loose
		my $choose = $loose{$line[0]};
		print "loose: ".$choose." ".$line[0]." ".$pkt{$choose}."\n";
		$score = $score + $pkt{$choose};
		$line[0] = $choose;
		print $score."\n";
	# A
	} elsif ($line[1] =~/Y/) {
		# you have to draw
		my $choose = $draw{$line[0]};
		print "draw: ".$choose." ".$line[0]." ".$pkt{$choose}."\n";		
		$score = $score + $pkt{$choose} + 3;
		$line[0] = $choose;
		print $score."\n";		
	# B	
	} else {
		# win!
		# you have to draw
		my $choose = $win{$line[0]};
		print "win: ".$choose." ".$line[0]." ".$pkt{$choose}."\n";		
		$score = $score + $pkt{$choose} + 6;
		$line[0] = $choose;
		print $score."\n";		
	}
};

print "Your Score: $score\n";

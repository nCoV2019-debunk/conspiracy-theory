#! /usr/bin/perl
use strict;

my $id;
my $seq;

while (<STDIN>) {
	chop;
	if (/^(>.+)/) {
		$id = $1;
	}
	else {
		$seq .= $_;
	}
}

my @base = split //, $seq;
my @nucleotide = ('A','T','G','C');

my $count=0;
while ($count <=$ARGV[0]) {
	my $i = int(rand(29001));
	my $seed = int(rand(4));
	if ($base[$i] ne $nucleotide[$seed]) {
		$base[$i] = $nucleotide[$seed];
#	print $nucleotide[$seed],"\n";
		$count++;
	}
}

$seq = join '', @base;
print $id,"\n",$seq,"\n";

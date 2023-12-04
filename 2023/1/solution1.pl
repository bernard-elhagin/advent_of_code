#!/usr/bin/perl
use warnings;
use strict;

open (my $input, '<', 'input1.txt') or die $!;

my $result;

while(<$input>) {
   s{[^0-9]}{}g;
   my @digits = split //;
   my $number = "$digits[0]$digits[-1]";

   $result += $number;
}

print $result;



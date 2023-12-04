#!/usr/bin/perl
use warnings;
use strict;

open (my $input, '<', 'input2.txt') or die $!;

my $result;

my %map = ( 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 );

while(<$input>) {
   for my $k (keys %map) {
      $_ =~ s/$k/$k$map{$k}$k/g;
   }

   s/\D//g;

   my @digits = split //;

   $result += "$digits[0]$digits[-1]";

}

print $result;



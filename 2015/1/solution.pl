#!/usr/bin/perl
use warnings;
use strict;

open (my $input, '<', 'input.txt') or die $!;

my @steps = split //, <$input>;

my $result = 0;
for(my $i = 0; $i < @steps; $i++) {
   my $s = $steps[$i];

   next unless $s eq '(' or $s eq ')';
   $result = $s eq '(' ? ($result + 1) : ($result - 1);

   if($result == -1) {
      print "Basement: " . ($i + 1) . "\n";
   }
}

print $result;

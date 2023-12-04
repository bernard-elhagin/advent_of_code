#!/usr/bin/perl
use warnings;
use strict;

open (my $input, '<', 'input2.txt') or die $!;

my $result;

while(<$input>) {
   my $id = $1 if s/^Game (\d+): //;

   my @sets = split /; ?/;

   my %gameMaxes = ( 'red' => 0, 'green' => 0, 'blue' => 0 );
   my $localResult = 1;

   foreach my $set (@sets) {
      foreach my $seg (split /, /, $set) {
         my ($num, $col) = split / |\n/, $seg;
         print "$num\t$col\n";
         if($num > $gameMaxes{$col}) {
            $gameMaxes{$col} = $num;
         }
      }
   }

   foreach my $col (keys %gameMaxes) {
      $localResult *= $gameMaxes{$col};
   }

   $result += $localResult;

}

print $result;

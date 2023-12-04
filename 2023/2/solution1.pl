#!/usr/bin/perl
use warnings;
use strict;

open (my $input, '<', 'input.txt') or die $!;

my %max = (
   'red'   => 12,
   'green' => 13,
   'blue'  => 14
);

my $result;

while(<$input>) {
   my $id = $1 if s/^Game (\d+): //;

   $result += $id;

   my @sets = split /; ?/;

   SET:
   foreach my $set (@sets) {
      foreach my $seg (split /, /, $set) {
         my ($num, $col) = split / |\n/, $seg;
         if($num > $max{$col}) {
            print "$id\n";
            $result -= $id;
            last SET;
         }
      }
   }

}

print $result;

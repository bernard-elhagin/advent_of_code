#!/usr/bin/perl
use warnings;
use strict;

use Data::Dumper;

open (my $input, '<', 'test.txt') or die $!;

my $result = 0;

my @lines = <$input>;

my $lines = @lines;
my $columns = (length $lines[0]) - 1;

my $engine;
foreach (0..11) {
   push @{ $engine->[0] }, '.';
}

my $idx = 1;
foreach my $line (@lines) {
   chomp $line;
   push @{ $engine->[$idx] }, '.';
   foreach my $c (split //, $line) {
      push @{ $engine->[$idx] }, $c;
   }
   push @{ $engine->[$idx] }, '.';
   $idx++;
}

foreach (0..11) {
   push @{ $engine->[$idx] }, '.';
}

my %numbers;
my $r;
foreach my $row (@{ $engine }) {
   my $c;
   $r++;
   my $curnum = 0;
   foreach my $col (@{ $row }) {
      $c++;
      if($col =~ /([0-9])/) {
         $curnum .= $1;
      }
      else {

         my $numrow   = $r - 1;
         my $numcol   = $c - 2;
         my $numlen   = length $curnum;
         my $rowstart = $numrow - 1;
         my $rowstop  = $numrow + 1;
         my $colstart = $numcol - $numlen;
         my $colstop  = $numcol + 1;

         my $keep = 0;
         foreach my $ir ($rowstart .. $rowstop) {
            foreach my $ic ($colstart .. $colstop) {
               my $n = $engine->[$ir]->[$ic];
               if(defined $n and $n =~ m/[^0-9.]/) {
                  $keep = 1;
               }
            }
         }

         if($keep and length $curnum) {
            $result += $curnum;
         }

         $curnum = "";
      }
   }
}

print $result;

__DATA__
       0    1    2    3    4    5    6    7    8    9    10   11
 0  [ '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.' ],
 1  [ '.', '4', '6', '7', '.', '.', '1', '1', '4', '.', '.', '.' ],
 2  [ '.', '.', '.', '.', '*', '.', '.', '.', '.', '.', '.', '.' ],
 3  [ '.', '.', '.', '3', '5', '.', '.', '6', '3', '3', '.', '.' ],
 4  [ '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.' ],
 5  [ '.', '6', '1', '7', '*', '.', '.', '.', '.', '.', '.', '.' ],
 6  [ '.', '.', '.', '.', '.', '.', '+', '.', '5', '8', '.', '.' ],
 7  [ '.', '.', '.', '5', '9', '2', '.', '.', '.', '.', '.', '.' ],
 8  [ '.', '.', '.', '.', '.', '.', '.', '7', '5', '5', '.', '.' ],
 9  [ '.', '.', '.', '.', '$', '.', '*', '.', '.', '.', '.', '.' ],
 0  [ '.', '.', '6', '6', '4', '.', '5', '9', '8', '.', '.', '.' ],
 1  [ '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.' ]

#!/usr/bin/perl

use strict;
use warnings;

use Convert::ASCII::String qw(string2ascii ascii2string);

no warnings;
#$Convert::ASCII::String::Sep = '.';
use warnings;

my ($transform, $return);

$transform = 'Premature optimization is the root of all evil.';

$return = string2ascii(\$transform, '.');

if ($return == 1) {
    print "$transform\n";
}
elsif ($return == -1) {
   print "No scalar reference provided.\n";
}

<STDIN>;

$return = ascii2string(\$transform, '.');

if ($return == 1) {
    print "$transform\n";
}
elsif ($return == -1) {
    print "No scalar reference or separator provided.\n";
}
elsif ($return == -2) {
    print "Separator mismatch.\n";
}

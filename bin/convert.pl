use Convert::ASCII::String q/:all/;

use strict;
use warnings;

my $return;

our $wisdom = 'Premature optimization is the root of all evil.';

#$Convert::ASCII::String::sep = '.';

$return = string2ascii(\$wisdom, '.');

if ($return == 1) {
    print "$wisdom\n";
}
elsif ($return == -1) {
   print "No scalar reference provided.\n";
}

<STDIN>;

$return = ascii2string(\$wisdom, '.');

if ($return == 1) {
    print "$wisdom\n";
}
elsif ($return == -1) {
    print "No scalar reference or separator provided.\n";
}
elsif ($return == -2) {
    print "Separator mismatch.\n";
}

#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use Convert::ASCII::String q/:all/;

# tests 1&2 - use_ok(), require_ok()
BEGIN {
    my $PACKAGE = 'Convert::ASCII::String';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}

# test 3 - string2ascii(\$data)
my $perl = 'perl';
string2ascii(\$perl);
is($perl, '112101114108', 'string2ascii (\$data)');

# test 4 - string2ascii(\$data, $separator)
$perl = 'perl';
string2ascii(\$perl, '.');
is($perl, '112.101.114.108', 'string2ascii (\$data, $separator)');

# test 5 - ascii2string(\$data, $separator)
ascii2string(\$perl, '.');
is($perl, 'perl', 'ascii2string (\$data, $separator)');


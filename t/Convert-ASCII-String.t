#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use Convert::ASCII::String q/:all/;

BEGIN {
    my $PACKAGE = 'Convert::ASCII::String';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}

my $perl = 'perl';
string2ascii(\$perl);
is($perl, '112101114108', 'string2ascii (\$data);');

$perl = 'perl';
string2ascii(\$perl, '.');
is($perl, '112.101.114.108', 'string2ascii (\$data, $separator);');

ascii2string(\$perl, '.');
is($perl, 'perl', 'ascii2string (\$data, $separator);');

#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

use Convert::ASCII::String qw(str2asc asc2str);

BEGIN {
    my $PACKAGE = 'Convert::ASCII::String';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}

is(str2asc('perl', '.'), '112.101.114.108', 'str2asc($string, [$sep]);');
is(asc2str('112.101.114.108', '.'), 'perl', 'asc2str($string, $sep);');

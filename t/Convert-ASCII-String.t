#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

# tests
BEGIN {
    my $PACKAGE = 'Convert::ASCII::String';
    use_ok ($PACKAGE);
    require_ok ($PACKAGE);
}

# test 3 - unpack C*
my @perl = unpack 'C*', 'perl';
my @perl_ascii = qw(112 101 114 108);
is (@perl, @perl_ascii, 'unpack C*'); 

# test 4 - pack C*
my $perl = pack 'C*', @perl_ascii;
is ($perl, 'perl', 'pack C*');

#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

# tests
BEGIN {
    my $PACKAGE = 'Convert::ASCII::String';
    use_ok ($PACKAGE);
    require_ok ($PACKAGE);
}

use Convert::ASCII::String q/:all/;

use strict;
use warnings;

#$Convert::ASCII::String::Sep = '.';

our $wisdom = 'Premature optimization is the root of all evil.';

my $ret = string2ascii(\$wisdom, '.');
print <<"EOT";
return: $ret
$wisdom
EOT

<STDIN>;

$ret = ascii2string(\$wisdom, '.');
print <<"EOT";
return: $ret
$wisdom
EOT

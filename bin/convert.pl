use Convert::ASCII::String q/:all/;

use strict;
use warnings;

#$Convert::ASCII::String::sep = '.';

our $wisdom = 'Premature optimization is the root of all evil.';

my $return = string2ascii(\$wisdom, '.');
print <<"EOT";
return: $return
$wisdom
EOT

<STDIN>;

$return = ascii2string(\$wisdom, '.');
print <<"EOT";
return: $return
$wisdom
EOT

use Convert::ASCII::String q/:all/;

use strict;
use warnings;

#$Convert::ASCII::String::Sep = '.';  

our $wisdom = 'Premature optimization is the root of all evil.';

string2ascii (\$wisdom, '.');
print "$wisdom\n";
<STDIN>;
ascii2string (\$wisdom, '.');
print "$wisdom\n";

use Convert::ASCII::String q/:all/;

$wisdom = 'Premature optimization is the root of all evil.';

string2ascii (\$wisdom, '.');
print "$wisdom\n";
<STDIN>;
ascii2string (\$wisdom, '.');
print "$wisdom\n";

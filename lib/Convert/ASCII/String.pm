# $Id: String.pm,v 0.29 2004/01/06 17:27:52 sts Exp $

package Convert::ASCII::String;

use 5.006;
use base(Exporter);
use strict 'vars';
use warnings;

our $VERSION = '0.29';

our @EXPORT_OK = qw(string2ascii ascii2string);
our %EXPORT_TAGS = (  all  =>    [ @EXPORT_OK ]
);

sub SUCCESS { 1 }
sub ARGS_MISMATCH { -1 }
sub SEP_MISMATCH { -2 }

=head1 NAME

Convert::ASCII::String - convert character strings to ASCII and vice versa.

=head1 SYNOPSIS

 use Convert::ASCII::String q/:all/;

 $transform = 'Premature optimization is the root of all evil.';

 string2ascii (\$transform, '.');

   80.114.101.109.97.116.117.114.101.32.
   111.112.116.105.109.105.122.97.116.105.
   111.110.32.105.115.32.116.104.101.32.114.
   111.111.116.32.111.102.32.97.108.108.32.
   101.118.105.108.46

 ascii2string (\$transform, '.');

   Premature optimization is the root of all evil.

=head1 DESCRIPTION

C<Convert::ASCII::String> basically converts strings to ASCII and vice versa.
It uses perl's built-in functions C<pack> & C<unpack>. Most time these functions
prove to be sufficient if data has to be converted and remains within memory.

C<Pack> & C<unpack> rely upon arrays to convert data and not without reason though.
Preserving multiple ASCII codes in a single string conveys some difficulty since
its hard to distinguish where from and where to each ASCII code ranges.

C<Convert::ASCII::String> solves this problem by allowing inserting a item separator
between each ASCII code (preferably a non-numeric value).

=head2 Appropriate usage

In most cases the usage of this module will prove to be inappropriate. If data will
remain within memory, then array ASCII conversion using C<pack> & C<unpack> is appropriate and
presumably faster than using C<Convert::ASCII::String>.

C<Convert::ASCII::String> uses C<join> & C<split> to merge array to strings and vice versa. 
Thus wise usage is recommended since such operations may slow down converting if much data
has be transformed. So, when to use then?

Whenever data has to be converted to ASCII and has to be stored on a disk or other mediums
where it will freed from the array it was previously kept in. C<pack> & C<unpack> will not be
able to convert an array to character if not each single ASCII code takes up its own index within
the array. Thus string transformation with an item separator.

=head1 FUNCTIONS

=head2 string2ascii

Converts a character string to ASCII inserting a separator between each ASCII code.

The separator is optional.

 string2ascii (\$data, '.');

 or

 string2ascii (\$data);

Beware, second option will not allow back converting from ASCII.

B<RETURN CODES>

=over 4

=item (1)

Success.

=item (-1)

No scalar reference provided.

=back

=cut

sub string2ascii {
    my ($data, $sep) = @_;
    $sep ||= ${__PACKAGE__.'::Sep'} || '';
    return ARGS_MISMATCH unless ref $data eq 'SCALAR';

    my @ascii = unpack 'C*', $$data;
    $$data = join $sep, @ascii;

    return SUCCESS;
}

=head2 ascii2string

And vice versa.

 ascii2string (\$data, '.');

B<RETURN CODES>

=over 4

=item (1)

Success.

=item (-1)

No scalar reference or separator provided.

=item (-2)

Separator mismatch.

=back

=cut

sub ascii2string {
    my ($data, $sep) = @_;
    $sep ||= ${__PACKAGE__.'::Sep'};
    return ARGS_MISMATCH unless ref $data eq 'SCALAR' && $sep;
    $sep = quotemeta $sep;
    return SEP_MISMATCH if $$data !~ /$sep/i;

    my @ascii = split $sep, $$data;
    $$data = pack 'C*', @ascii;

    return SUCCESS;
}

1;
__END__

=head2 OPTIONS

The separator may alternatively be set by

 $Convert::ASCII::String::Sep = '.';

Function delivery becomes then superfluous.

=head1 EXPORT

C<string2ascii(), ascii2string()> upon request.

B<TAGS>

C<:all - *()>

=head1 SEE ALSO

perl(1)

=head1 LICENSE

This program is free software; 
you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Steven Schubiger

=cut

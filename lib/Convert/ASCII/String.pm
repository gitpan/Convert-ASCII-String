#
# $Id: String.pm,v 0.24 2004/01/06 17:27:52 sts Exp $

package Convert::ASCII::String;

our $VERSION = '0.24';

use strict 'vars';
use warnings;

use Exporter;
use base qw(Exporter);

our (@EXPORT_OK, %EXPORT_TAGS, @subs);

@subs = qw(string2ascii ascii2string);

@EXPORT_OK = @subs;
%EXPORT_TAGS = (  all  =>    [ @subs ]
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
It uses perl's built-in functions I<pack> & I<unpack>. Most time these functions
prove to be sufficient if data has to be converted and remains within memory.

I<Pack> & I<unpack> rely upon arrays to convert data and not without reason though.
Preserving multiple ASCII codes in a single string conveys some difficulty since
its hard to distinguish where from and where to each ASCII code ranges.

C<Convert::ASCII::String> solves this problem by allowing inserting a item separator
between each ASCII code (preferably a non-numeric value).

=head2 Appropriate usage

In most cases the usage of this module will prove to be inappropriate. If data will
remain within memory, then array ASCII conversion using I<pack> & I<unpack> is appropriate and
presumably faster than using C<Convert::ASCII::String>.

C<Convert::ASCII::String> uses I<join> & I<split> among I<pack> & I<unpack> to merge array to
strings and vice versa. Thus wise usage is recommended since such operations may slow down
converting if much data has be transformed. So, when to use then?

Whenever data has to be converted to ASCII and has to be stored on a disk or other mediums
where it will freed from the array it was previously kept in. I<pack> & I<unpack> will not be
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
    my ($data_ref, $sep) = @_;
    $sep ||= ${__PACKAGE__.'::sep'} || '';
    return ARGS_MISMATCH unless ref $data_ref eq 'SCALAR';

    my @ascii = unpack 'C*', $$data_ref;
    $$data_ref = join $sep, @ascii;

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
    my ($data_ref, $sep) = @_;
    $sep ||= ${__PACKAGE__.'::sep'};
    return ARGS_MISMATCH unless ref $data_ref eq 'SCALAR' && $sep;
    $sep = quotemeta $sep;
    return SEP_MISMATCH if $$data_ref !~ /$sep/i;

    my @ascii = split $sep, $$data_ref;
    $$data_ref = pack 'C*', @ascii;

    return SUCCESS;
}

1;
__END__

=head2 OPTIONS

The separator may alternatively be set by

 $Convert::ASCII::String::sep = '.';

Function delivery becomes then superfluous.

=head2 EXPORT

C<string2ascii(), ascii2string()> upon request.

B<TAGS>

C<:all - *()>

=head1 SEE ALSO

perl(1)

=head1 LICENSE

This program is free software; you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Steven Schubiger

=cut

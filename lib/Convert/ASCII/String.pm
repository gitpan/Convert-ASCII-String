package Convert::ASCII::String;

$VERSION = '0.36';
@EXPORT_OK = qw(str2asc asc2str);

use strict;
use vars qw($Sep);
use base qw(Exporter);
use Carp 'croak';

=head1 NAME

Convert::ASCII::String - Convert character strings to ASCII

=head1 SYNOPSIS

 use Convert::ASCII::String qw(str2asc asc2str);

 $transform = 'Qui vult dare parva non debet magna rogare.';

 str2asc( $transform, '.' );

   81.117.105.32.118.117.108.116.32.100.
   97.114.101.32.112.97.114.118.97.32.110.
   111.110.32.100.101.98.101.116.32.109.97.
   103.110.97.32.114.111.103.97.114.101.46

 asc2str( $transform, '.' );

   Qui vult dare parva non debet magna rogare.

=head1 DESCRIPTION

Convert::ASCII::String basically converts strings to ASCII.
It applies the internal functions C<pack> & C<unpack>. Most time these functions prove 
to be sufficient if data has to be converted and remains within memory.

C<pack> & C<unpack> rely upon arrays to convert data and not without reason though.
Preserving multiple ASCII values in a single string conveys some difficulty since
its hard to distinguish where from and where to each ASCII value ranges.

This module solves this problem by allowing to insert an item separator
between each ASCII value (preferably a non-numeric value).

=head2 Appropriate usage

In most cases, the usage of this module will prove to be inappropriate. If data will
remain within memory, then array ASCII conversion using C<pack> & C<unpack> is appropriate and
presumably faster than using C<Convert::ASCII::String>.

So, when to use then?

Whenever data has to be converted to ASCII and has to be stored in files or kept in strings.
C<pack> & C<unpack> will not be able to convert an array to character if not each single 
ASCII value takes up its own index within the array; thus string transformation with 
an item separator.

=head1 FUNCTIONS

=head2 str2asc

Converts a character string to ASCII (inserting a separator between each ASCII value).

The separator is optional.

 str2asc( $str, '.' );

 or

 str2asc( $str );

Beware, second option will not allow back converting from ASCII.

=cut

sub str2asc {
    my ($str, $sep) = @_;
    $sep ||= $Sep || '';
    
    croak 'usage: str2asc( $str, [$sep] )' unless $str;  
      
    return join $sep, unpack 'C*', $str;
}

=head2 asc2str

And vice versa.

 asc2str( $asc, '.' );

=cut

sub asc2str {
    my ($asc, $sep) = @_;
    $sep ||= $Sep; 
    
    croak 'usage: asc2str( $asc, $sep )' unless ($asc && $sep);    
    croak 'Separator mismatch' unless $asc =~ /\Q$sep/i; 
              
    return pack 'C*', split /\Q$sep/, $asc;
}

1;
__END__

=head2 OPTIONS

$Convert::ASCII::String::Sep may contain a global separator.

Function delivery of a separator becomes then superfluous.

=head1 EXPORT

C<str2asc(), asc2str()> are exportable.

=cut

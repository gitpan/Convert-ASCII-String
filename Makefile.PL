use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    DISTNAME     => 'Convert-ASCII-String',
    NAME         => 'Convert::ASCII::String',
    VERSION_FROM => 'lib/Convert/ASCII/String.pm', # finds $VERSION
    PREREQ_PM    => { Carp        => 0,
                      Exporter    => 0,
                   },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
       (ABSTRACT   => 'Convert character strings to ASCII and vice versa.',
        AUTHOR     => 'Steven Schubiger') : ()),
);

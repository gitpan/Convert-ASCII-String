use ExtUtils::MakeMaker;
WriteMakefile(
    DISTNAME     => 'Convert-ASCII-String',
    NAME         => 'Convert::ASCII::String',
    VERSION_FROM => 'lib/Convert/ASCII/String.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Convert/ASCII/String.pm') : ()
    ),
);

use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Convert::ASCII::String',
    VERSION_FROM => 'lib/Convert/ASCII/String.pm',
    PREREQ_PM    => { Exporter => 0 },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Convert/ASCII/String.pm') : ()
    ),
);

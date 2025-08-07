use strict;
use ExtUtils::MakeMaker;

my %clean = (
    'FILES' => '$(DISTVNAME).tar$(SUFFIX) *.ppd'
);

WriteMakefile(
    NAME => 'HomelabDash',
    AUTHOR => 'Josh Burns <joshyburnss@gmail.com>',
		LICENSE => 'perl_5',
		VERSION => '0.1.0',
		EXE_FILES => ['bin/homelabdash'],
		PREREQ_PM => {
			'YAML::XS' => 0,
			'Log::Log4perl'	=> 0,
			'Mojolicious' => 0,
			'FindBin'	=> 0,
		},
		ABSTRACT => 'A simple web dashboard for your homelab',
		'clean' => \%clean,
);



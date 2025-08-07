use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'HomelabDash',
    AUTHOR => 'Josh Burns <joshyburnss@gmail.com>',
		LICENSE => 'perl_5',
		EXE_FILES => ['bin/homelabdash'],
		PREREQ_PM => {
			'YAML::XS' => 0,
			'Log::Log4perl'	=> 0,
			'Mojolicious::Lite' => 0,
			'FindBin'	=> 0,
		},
		ABSTRACT => 'A simple web dashboard for your homelab',
);

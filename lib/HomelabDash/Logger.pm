package HomelabDash::Logger;
use strict;
use warnings;

use Log::Log4perl;

my $logger;

sub init {
	my ($level) = @_;
	$level ||= 'INFO';

	my $conf = qq(
		log4perl.logger = $level, Screen
		log4perl.appender.Screen = Log::Log4perl::Appender::Screen,
		log4perl.appender.Screen.stderr = 0
		log4perl.appender.Screen.layout = Log::Log4perl::Layout::PatternLayout
		log4perl.appender.Screen.layout.ConversionPattern = [%d] [%p] %m%n
	);

	Log::Log4perl::init( \$conf );
	$logger = Log::Log4perl->get_logger();
	return $logger;
}

sub get {
	return $logger;
}

1;

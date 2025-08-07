package HomelabDash::Config;
use strict;
use warnings;

use YAML::XS qw(LoadFile);

our $CONFIG;

sub load_config {
	my ($config_path) = @_;

	my $yaml_config = LoadFile($config_path);

	# Merge ENV variables into config
	$yaml_config->{server_port}	= $ENV{'PORT'} || 3333;
	$yaml_config->{server_log_level} = $ENV{'LOG_LEVEL'} || 'INFO';

	if(defined $ENV{'THEME'}) {
		$yaml_config->{theme} = $ENV{'THEME'};
	}

	$CONFIG = $yaml_config;
	return $CONFIG;
}

sub get {
	my $key = shift;
	return $CONFIG->{$key};
}

1;

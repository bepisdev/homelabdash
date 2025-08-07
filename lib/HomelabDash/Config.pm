package HomelabDash::Config;
use strict;
use warnings;

use YAML::XS qw(LoadFile);

our $CONFIG;

sub load_config {
	my ($config_path) = @_;

	my $yaml_config = LoadFile($config_path);

	# Merge ENV variables into config
	$yaml_config->{server_port}	= $ENV{'PORT'} if defined $ENV{'PORT'} || 3333;
	$yaml_config->{server_log_level} = $ENV{'LOG_LEVEL'} if defined $ENV{'LOG_LEVEL'} || 'INFO';
	$yaml_config->{theme} = $ENV{'THEME'} if defined $ENV{'THEME'} || 'dark';

	$CONFIG = $yaml_config;
	return $CONFIG;
}

sub get {
	my $key = shift;
	return $CONFIG->{$key};
}

1;

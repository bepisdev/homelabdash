package HomelabDash::Config;
use strict;
use warnings;

use YAML::XS qw(LoadFile);

our $CONFIG;

sub load_config {
	my $config_path = '/config/dashboard.yml';

	# unless (-e $config_path) {
	# 	die "Configuration file not found: $config_path";
	# }

	my $yaml_config = LoadFile($config_path) if -e $config_path;

	# Merge ENV variables into config
	$yaml_config->{server_port}	= $ENV{'PORT'} if defined $ENV{'PORT'};
	$yaml_config->{server_log_level} = $ENV{'LOG_LEVEL'} if defined $ENV{'LOG_LEVEL'};

	$CONFIG = $yaml_config;
	return $CONFIG;
}

sub get {
	my $key = shift;
	return $CONFIG->{$key};
}

1;

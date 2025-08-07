package HomelabDash::Server;
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Mojolicious::Lite -signatures;
use HomelabDash::Logger;

sub run {
	my ($class, $config) = @_;

	my $logger = HomelabDash::Logger::get();
	my $port = $config->{server_port} || 3333;

	app->defaults->{config} = $config;
	app->renderer->paths(["$FindBin::Bin/../templates"]); 

	get '/' => sub {
		my $c = shift;
		$logger->info("Rendering dashboard page");
		$c->render(
			template => 'dashboard',
		);
	};

	$logger->info("Starting HomelabDash on port $port");
	app->start('daemon', '-l', "http://*:$port");
}

1;

package HomelabDash::Server;
use strict;
use warnings;

use Mojolicious::Lite -signatures;
use HomelabDash::Logger;

app->static->paths(["/opt/homelabdash/public"]);
app->renderer->paths(["/opt/homelabdash/templates"]); 

sub run {
	my ($config) = @_;

	my $logger = HomelabDash::Logger::get();
	my $port = $config->{server_port} || 3333;

	app->defaults->{config} = $config;

	get '/' => sub {
		my $c = shift;
		my $conf = app->defaults->{config};

		$logger->info("Rendering dashboard page");

		$c->render(
			template => 'dashboard',
			config => $conf,
			page_title => $conf->{title},
			sections => $conf->{sections} || [],
		);
	};

	$logger->info("Starting HomelabDash on port $port");
	app->start('daemon', '-l', "http://*:$port");
}

1;

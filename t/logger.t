use strict;
use warnings;
use Test::More tests => 1;

use lib 'lib';
use HomelabDash::Logger;

my $logger = HomelabDash::Logger::init('DEBUG');
ok($logger->isa('Log::Log4perl::Logger'), 'Logger Initialized');

package appMgr;

=pod
Purpose : 
Date    : 8/5/14
Author  : Jan Samborski
=cut

use lib qw(. .. lib /tools/lib2); 
use strict;
use warnings;
use Mouse;
use Mouse::Util::TypeConstraints;

#---------------------[ CLASS VARS ]---------------------

#---------------------[ PROPERTIES ]---------------------
has( 'hConfig'	, is => 'rw', isa => 'HashRef');

#---------------------[ MODULINO ]---------------------

my %hParms = (
	inDir 	=> ['inDir=s'		, 't/'			],
	inFile 	=> ['inFile=s'	, 'sa28'		],
	outDir 	=> ['outDir=s'	, 't/'			],
	outFile => ['outFile=s'	, 'sa28.csv'],
	t1			=> ['t1=s'	],		# no default
);

my $cUsage = "this is test usage";

__PACKAGE__->new(
	parms 		=> \%hParms,
	valid 		=> \&chkParms,
	usage			=> \$cUsage,
)->_run unless caller;

sub _run { 
	my ($self) = @_; 
	eval {
		$self->setup();
		$self->main ();
		$self->teardown();
	};

	if ($@) {
		die ("FAIL: $@ \n");
	}	
}

sub chkUsage {

}

#---------------------[ METHODS ]---------------------
sub setup {
	my ($self, )  = @_;
}

sub main  {
	my ($self, )  = @_;
}

sub teardown {
	my ($self, )  = @_;
}

1;


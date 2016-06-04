package jjs2;

use lib qw(. .. lib /tools/lib2);

use strict;
use warnings;
use misc;

#---------[ CLASS Variables  ]------------

#---------[ Modulino  ]------------
my %hDefaults = (
	debug => 1,
);

__PACKAGE__->new(
	junk1 => 'this is junk1',
	junk2 => 'this is junk2',
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



#---------[ PUBLIC METHODS ]------------
sub new { 
	my $class = shift;	
	my %hParms = @_;

	my $self = {
		%hDefaults,
		%hParms,
	};

	bless ($self, $class); 
	$self;
}; 

sub setup { 
	my $self = shift;	
	my $nRtn = 0;
	$self->helloWorld();
	return $nRtn;
}

sub helloWorld { 
	my $self = shift;	
	my $nRtn = 0;
	print "Good Day World\n";
	return $nRtn;
}



sub main { 
	my $self = shift;	
	my $nRtn = 0;
	return $nRtn;
}

sub teardown { 
	my $self = shift;	
	my $nRtn = 0;
	return $nRtn;
}

#---------[ PRIVATE METHODS  ]------------

1;



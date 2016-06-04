package jjs2;

use lib qw(. .. lib /tools/lib2);

use strict;
use warnings;
use misc;

#---------[ CLASS Variables  ]------------
# %s/jjs2/jjs2/g
# sav jjs2.pm

#---------[ CLASS Variables  ]------------
my %hDefaults = (
	debug => 1,
);

__PACKAGE__->new(
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


#---------[ CLASS Variables  ]------------

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
	return $nRtn;
}

sub helloWorld { 
	my $self = shift;	
	my $nRtn = 0;
	print "Good Morning World\n";
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



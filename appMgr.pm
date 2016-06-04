package appMgr;

=pod
Purpose : 
Date    : 8/5/14
Author  : Jan Samborski
=cut

use lib qw(. .. lib /tools/lib2); 
use strict;
use warnings;
use Getopt::Long;

#---------------------[ CLASS VARS ]---------------------

#---------------------[ PROPERTIES ]---------------------

#---------------------[ MODULINO ]---------------------
# perl -d appMgr.pm -inFile t/jjs.in -outFile t/jjs.out 

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
	usage			=> $cUsage,
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

sub chkParms {
	my $self = shift;
	my @aErrs;

	push @aErrs, sprintf ("inFile not defined"	, $self->{inFile}) 	unless defined $self->{inFile}; 
	push @aErrs, sprintf ("outFile not defined"	, $self->{outFile}) unless defined $self->{outFile}; 
	push @aErrs, sprintf ("t1 not defined"			, $self->{t1}) unless defined $self->{t1}; 

	return \@aErrs;	
}

sub setup {
	my ($self, )  = @_;
}

sub main  {
	my ($self, )  = @_;
	$self->getOptions();
	$self->prnParms();
	$self->validate();
}

sub teardown {
	my ($self, )  = @_;
}
#---------------------[ END OF MODULINO ]---------------------

sub new { 
	my $class = shift;	
	my %hParms = @_;

	my $self = {
		hParms 		=> \%hParms,
		hGetOpts	=> {},
		usage 		=> "no usage defined",
		valid 		=> undef,
	};
	
	for my $cKey (sort keys %{$hParms{parms}}) {
		my ($cGetOptKey, $cDefault) = @{$hParms{parms}{$cKey}};

		# 'exception=s'	=> \$hConfig{exception},

		$self->{$cKey} = $cDefault if $cDefault;
		$self->{hGetOpts}{$cGetOptKey} 	= \$self->{$cKey};
	}
	$self->{valid} = $hParms{valid} if $hParms{valid};
	$self->{usage} = $hParms{usage} if $hParms{usage};
	bless ($self, $class); 
	$self;
}; 



#---------------------[ METHODS ]---------------------
sub getOptions  { 
	my $self = shift;	
	my $nRtn;
	GetOptions (%{$self->{hGetOpts}});
	my $raErrs = $self->validate();
	$self->show_usage(@$raErrs) if @$raErrs; 
	return $nRtn;
}

sub prnParms { 
	my $self = shift;	
	$DB::single = 1; 
	for (keys %{$self->{hParms}{parms}}) {
		print "$_: ", $self->{$_}, "\n";
	}
	$DB::single = 1; 
}


sub validate { 
	my $self = shift;	
	my $raErrs;
	return $raErrs unless $self->{valid};
	$self->show_usage("valid must be a codeRef") unless ref $self->{valid} eq "CODE";
	$raErrs = $self->{valid}->($self); 
	return  $raErrs;	
}

sub show_usage { 
	my $self = shift;	
	for (@_) {
		print "$_\n";
	}

	print $self->{usage}, "\n";
	exit 23;
}

1;


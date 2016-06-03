#! /usr/bin/perl -w 

=pod
Script  : mp3_tagger.pl
Purpose : <MODULE_PURPOSE>
Date    : 06/02/16
Author  : <YOUR_NAME_HERE>
Example : <EXAMPLE_USAGE>
=cut

#---------------------------[ Libs  ]-----------------------------------

use lib qw(. .. lib /tools/lib2);

use strict;
use warnings;
use misc;
use mp3_tagger;
use Getopt::Long;


#---------------------------[ global vars  ]-----------------------------------
my %hConfig = (
	debug	=> 1,
);
my %hParms = ( 
	'h|help'     	=> \$hConfig{help},
	'debug'   		=> \$hConfig{debug},
	'exception=s'	=> \$hConfig{exception},
	'conf=s'   		=> \$hConfig{conf},
	'preview'  		=> \$hConfig{preview},
	'type'  			=> \$hConfig{type},
);   

my $oWork;

#---------------------------[ main script ]-----------------------------------

eval {
  setup();
  main ();
  teardown();
};

if ($@) {
	chomp $@;
  mp3_tagger::ShowUsage ("FAIL: $@ \n");
}

#---------------------------[ Application Subs  ]-----------------------------------


#---------------------------[ Generic Subs  ]-----------------------------------
sub main {
	my ($cParm1) = @_;
	my $nRtn = 0;
	$oWork->main();
	
 	return $nRtn;
}


sub setup {
	my ($cParm1) = @_;
	my $nRtn = 0;

 	GetOptions (%hParms) 		or mp3_tagger::ShowUsage();
	mp3_tagger::ShowUsage() 	if $hConfig{help};
	my %hTmp = removeUndefFromHash(%hConfig);
	$oWork = mp3_tagger->new(
		%hTmp,
	);
	
	$oWork->setup();

	return $nRtn;
}



sub teardown {
	my ($cParm1) = @_;
	my $nRtn = 0;
	$oWork->teardown();

	return $nRtn;
}






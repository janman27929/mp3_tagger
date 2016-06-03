#! /usr/bin/perl -w 

#=====================[ mp3_tagger ]=====================
package mp3_tagger;

=pod
Script  : mp3_tagger.pm
Purpose : <MODULE_PURPOSE>
Date    : 06/02/16
Author  : <YOUR_NAME_HERE>
=cut

use lib qw(. .. lib /tools/lib2); 
use strict;
use misc;
use Mouse;
use Mouse::Util::TypeConstraints;

#---------------------[ CLASS VARS ]---------------------
has( 'aRef'		, is => 'rw', isa=>'ArrayRef' , default => sub {[]});


sub setup {
	my ($self, )  = @_;
	$self->testParms();

}

sub testParms  {
	my ($self, )  = @_;
}

sub main  {
	my ($self, )  = @_;
}

sub teardown {
	my ($self, )  = @_;
}

#---------------------[ START MODULINO ]---------------------
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
#---------------------[ END OF MODULINO ]---------------------


sub  ShowUsage {
	my ($cMsg) = @_;
	print "\n---[ $cMsg ]---\n\n" if $cMsg;
	print <<SHOW_USAGE;

$0 - <INSERT_general_desc>
--------------------------------------------

USAGE: $0 [-optTag1 -optParm1] [-optParm2] -MandatoryTag1 MandatoryParm1 

Parameters
----------
--optTag1 -optParm1
	DescriptionOfOptTag1

--optParm2
	DescriptionOfOptTag2

--MandatoryTag1 MandatoryParm1
	DescriptionOfMandatoryTag1

Example
--------
$0 [-optTag1 -optParm1] [-optParm2] -MandatoryTag1 MandatoryParm1 


SHOW_USAGE
exit 33;
}



1;


#! /usr/bin/perl -w 

package Test_mp3_tagger;

=pod
Script  : mp3_tagger.t
Purpose : <MODULE_PURPOSE>
Date    : 06/02/16
Author  : <YOUR_NAME_HERE>
=cut


use lib qw(. .. /tools/lib2); 
use strict;
use warnings;
use Test::More;
use Test::Exception;
use File::Find; 
use base qw(Test::Class);

#---------------------[ GLOBALS ]---------------------
my $oTest;
my @aFiles;

#---------------------[ SCRIPT starts here  ]---------------------
__PACKAGE__->new(
)->runtests unless caller;


sub startup : Test( startup ) {
	my $cDir = 't/music';
	find (\&get_mp3, $cDir);


}

sub get_mp3 {
	return unless -f ;
	return unless /mp3$/i; 
	push @aFiles, $File::Find::name;
}

sub setup : Test( setup ) {
	my ($self) = @_;
}

sub shutdown : Test( shutdown  ) {
	my ($self) = @_;
}

# teardown methods are run after every test method.
sub teardown : Test(teardown) {
}


sub parse_filename  {
	my $cFile = shift;
	my $cInTemplate= shift;
	my $cOutTemplate = shift;
	my $rhOverRides = shift;
	my $cOutFile;

	die ("FAIL: missing \$cFile \n") 					unless defined $cFile;
	die ("FAIL: missing \$cInTemplate \n") 		unless defined $cInTemplate;
	die ("FAIL: missOutg \$cOutTemplate \n") 	unless defined $cOutTemplate;

=pod


=cut



	return $cOutFile;
}


sub test_parse_filename: Tests {
	$DB::single = 1; 
	use_ok( 'mp3_rename' );
	can_ok( 'mp3_rename', 'new' );

	my $oTest = mp3_rename->new (
		inFile 			=> 't/music/artist2/album1/d1.t1.Mamma gamma.mp3', 
		inTemplate 	=> 't/music/<ARTIST>/<ALBUM>/d<DISC>.t<TRACK>.<TITLE>.mp3',
		outTemplate => 't/music/artist2/<ALBUM>/<DISC>.<TRACK>.<TITLE>.mp3',
		overRides		=> {
			artist 	=> "Bahama Mamas",
			album 	=> "Sipping the Sun",
		},
	);
	is $oTest->overRides->{artist}, "Bahama Mamas",	'overRides->artist ';


	my @aResults;
	# test blank line
	my %hPrev;
	$hPrev{inFile}  = $oTest->smartSet("inFile", "");
	is $oTest->parse_filename(), undef, "blank line passed";

	# test blank line with missing parms
	$hPrev{inTemplate}  = $oTest->smartSet("inTemplate", "");
	dies_ok {parse_filename()} "dies_ok with missing \$cFile";
	dies_ok {parse_filename('')} "dies_ok with missing \$cInTemplate";
	dies_ok {parse_filename('',$cInTemplate )} "dies_ok with missing \$cOutTemplate";
	dies_ok {parse_filename('')}, "dies_ok with missing \$cFile";

	# test line with no matches
	is parse_filename($cFile, $cInTemplate, $cOutTemplate), undef, "\$cFile with no templates returns undef";
	# test line with 1 match
	# test line with 2 matches

	$cInTemplate ='t/music/<ARTIST>/<ALBUM>/d<DISC>.t<TRACK>.<TITLE>.mp3';
	$cOutTemplate ='t/music/artist2/<ALBUM>/<DISC>.<TRACK>.<TITLE>.mp3';
	# is parse_filename($cFile, $cInTemplate, $cOutTemplate), '', "blank line passed";



	


};




sub test_bad: Tests {
};



#=====================[ Test Methods ]=====================


1;

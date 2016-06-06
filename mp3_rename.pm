package mp3_tagger;

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
my %hTypes = (
	artist 	=> '.*?',
	album 	=> '.*?',
	disc 		=> '\d+',
	track 	=> '\d+',
	seq 		=> '\d+',
	title 	=> '.*?',
);


#---------------------[ PROPERTIES ]---------------------
has( 'inFile'				, is => 'rw', isa => 'Str');
has( 'inTemplate'		, is => 'rw', isa => 'Str');
has( 'outTemplate'	, is => 'rw', isa => 'Str');
has( 'inRegEx'			, is => 'rw', isa => 'Regexp');
has( 'overRides'		, is => 'rw', isa => 'HashRef');

#---------------------[ MODULINO ]---------------------
__PACKAGE__->new(
	inFile 			=> 't/music/artist2/album1/d1.t1.Mamma gamma.mp3', 
	inTemplate 	=> 't/music/<ARTIST>/<ALBUM>/d<DISC>.t<TRACK>.<TITLE>.mp3',
	outTemplate => 't/music/artist2/<ALBUM>/<DISC>.<TRACK>.<TITLE>.mp3',
	inRegEx			=>  qr#t/music/(.*?)/(.*?)/d(\d+).t(\d+).(.*?)\.mp3#i,
	overRides		=> {
		artist 	=> "Bahama Mamas",
		album 	=> "Sipping the Sun",
	},
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

sub parseFile {
	my ($self, )  = @_;

	my $cOutFile;

	die ("FAIL: missing cFile \n") 					unless defined $self->cFile;
	die ("FAIL: missing cInTemplate \n") 		unless defined $self->cInTemplate;
	die ("FAIL: missOutg cOutTemplate \n") 	unless defined $self->cOutTemplate;
	

	if ($qrInFile) {
		$cOutFile = $cOutTemplate;
		$cOutFile =~ s/<ARTIST>/$1/g;
		$cOutFile =~ s/<ALBUM>/$2/g;
		$cOutFile =~ s/<DISK>/$3/g;
		$cOutFile =~ s/<TRACK>/$4/g;
		$cOutFile =~ s/<TITLE>/$5/g;
	}

}


1;


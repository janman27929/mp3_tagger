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
use base qw(Test::Class);

#---------------------[ GLOBALS ]---------------------
my $oTest;

#---------------------[ SCRIPT starts here  ]---------------------
__PACKAGE__->new(
)->runtests unless caller;


sub startup : Test( startup => 2 ) {
	my ($self) = @_;
	my $cClass = "mp3_tagger";
	use_ok( $cClass);
	can_ok( $cClass, 'new' );
	$self->{good} = $cClass->new(
	);
	$self->{bad} = $cClass->new(
	);
	isa_ok( $self->{good}, $cClass );
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

sub chkSetup_good  {
	my ($self) = @_;
	my $cSub = "chkSetup_good";
	my $oTest = $self->{good};
	lives_ok {$oTest->setup()} "OK: lives_ok: $cSub";
	# check for valid object condtions here
}

sub chkSetup_bad  {
	my ($self) = @_;
	my $cSub = "chkSetup_bad";
	my $qrErrMsg = qr/Both cmd and cmdfile/;
	my $oTest = $self->{bad};

	dies_ok {$self->setup()} "OK: dies_ok: $cSub";
	chomp $@;
	like ($@, $qrErrMsg, "OK: $cSub: [@_]");   
}

sub test_good: Tests {
	my ($self) = @_;
	my $cSub = "test_good";
	my $oTest = $self->{good};
	#is $oTest->someVal, "good_val", "$cSub: PASS: some_text";
};

sub test_bad: Tests {
	my ($self) = @_;
	my $cSub = "test_bad";
	my $oTest = $self->{bad};
	#is $oTest->someVal, "bad_val", "$cSub: PASS: some_text";
};



#=====================[ Test Methods ]=====================


1;

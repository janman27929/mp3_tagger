use MP3::Tag;

use strict;
my $filename = "Mammagamma.mp3";

my $mp3 = MP3::Tag->new($filename);

# get some information about the file in the easiest way
my ($song, $track, $artist, $album) = $mp3->autoinfo();

# or have a closer look on the tags

# scan file for existing tags
$mp3->get_tags;

$DB::single = 1; 
if (exists $mp3->{ID3v1}) {
			# read some information from the tag
		my $id3v1 = $mp3->{ID3v1};  # $id3v1 is only a shortcut for $mp3->{ID3v1}
		print $id3v1->song;
		
		# change the tag contents
		$id3v1->all("Song","Artist","Album",2001,"Comment",10,"Top 40");
		$id3v1->write_tag;
}

if (exists $mp3->{ID3v2}) {
		# read some information from the tag
		my ($name, $info) = $mp3->{ID3v2}->get_frame("TIT2");
		# delete the tag completely from the file
		$mp3->{ID3v2}->remove_tag;
} else {
		# create a new tag
		$mp3->new_tag("ID3v2");
		$mp3->{ID3v2}->add_frame("TALB", "Album title");
		$mp3->write_tag;
}

$mp3->close();

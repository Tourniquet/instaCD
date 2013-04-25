use strict;
use warnings;

use Data::Dumper;

if ( defined $ARGV[0] ) {
	push(@INC, $ARGV[0]);
} else {
	#no include path amendment given
}

require HotKey;
HotKey->import;


my $storage = "~/.instaCD";
my $paths = {};


open my $fp, "<", glob($storage) or die "Could not open $storage. ($!)";
#print STDERR "Hit one of the following keys to cd there:\n";
foreach (<$fp>){
	my $key = substr($_, 0, 1);
	my $path = substr($_, 2);
	chomp $path;
	$paths->{$key} = $path;
	print STDERR "[$key] $path\n";
}

my $choice = readkey();
if (exists $paths->{$choice}){
	print $paths->{$choice};
} else {
	#print STDERR "not in list, screw this\n";
	exit;
}

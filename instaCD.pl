use strict;
use warnings;

use Data::Dumper;
use Cwd;
my $storage = "~/.instaCD";

if ( defined $ARGV[0] ) {
	push(@INC, $ARGV[0]);
} else {
	#no include path amendment given, script will probably crash because it can't find HotKey
}

require HotKey;
HotKey->import;

if ( defined $ARGV[1] ) {
	if( $ARGV[1] eq "add" ){

		#check the hotkey argument
		if( ! defined $ARGV[2] ){
			print STDERR "add missing second argument. Usage: add HOTKEY [DIRECTORY]\n";
			exit;
		} elsif ( length($ARGV[2]) != 1 ){
			print STDERR "HOTKEY argument must be 1 character long\n";
			exit;
		}

		#determine directory to add
		my $dir;
		if( defined $ARGV[3] ){
			$dir = $ARGV[3]
		} else {
			$dir = getcwd();
		}

		add($ARGV[2], $dir);

	} elsif ( length($ARGV[1]) == 1 ){
		my $choice = $ARGV[1];
		my $paths = getPaths();
		if (exists $paths->{$choice}){
			print $paths->{$choice};
		} else {
			print STDERR "$choice is no shortcut\n";
		}
		exit;
	} else {
		print STDERR "Unknown command ".$ARGV[1]."\n";
	}

} else {
	askPath();
}

sub getPaths{
	my $paths = {};

	open my $fp, "<", glob($storage) or die "Could not open $storage. ($!) You might want to use `instaCD add HOTKEY` to define some directories.\n";
#print STDERR "Hit one of the following keys to cd there:\n";
	foreach (<$fp>){
		my $key = substr($_, 0, 1);
		my $path = substr($_, 2);
		chomp $path;
		$paths->{$key} = $path;
	}

	return $paths;
}


sub askPath{
	my $paths = getPaths();

	while( my ($key, $path) = each %{$paths}){
		print STDERR "[$key] $path\n";
	}

	my $choice = readkey();
	if (exists $paths->{$choice}){
		print $paths->{$choice};
	} else {
		#print STDERR "not in list, screw this\n";
		exit;
	}
}

sub add{
	my $key = shift;
	my $path = shift;

	print STDERR "adding [$key] $path\n";
	open my $fp, ">>", glob($storage) or die "Could not open $storage. ($!)";
	print $fp "$key $path\n";
	close $fp;

}

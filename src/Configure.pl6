# Note that this is *not* run during panda install
# The example here is what the 'make' call in Build.pm does
use LibraryMake;

my $destdir = '../lib';
my %vars = get-vars($destdir);
process-makefile('.', %vars);
make('src', $destdir);

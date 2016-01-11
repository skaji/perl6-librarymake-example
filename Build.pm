use v6;
use Panda::Builder;
use LibraryMake;
use Shell::Command;

class Build is Panda::Builder {
    method build($workdir) {
        my $dest = "$workdir/resources/lib";
        mkpath $dest unless $dest.IO.d;
        make("$workdir/src", $dest);
        my $lib = "libadd";
        my $so = get-vars('')<SO>;
        my @fake = <.so .dll .dylib>.grep({$_ ne $so});
        for @fake -> $fake {
            my $file = "$dest/$lib$fake";
            $file.IO.spurt("fake\n");
        }
    }
}

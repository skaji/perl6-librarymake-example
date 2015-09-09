use v6;
use Panda::Common;
use Panda::Builder;
use LibraryMake;
use Shell::Command;

=begin pod

During make, LibraryMake or panda appends the following rpath:

  -Wl,-rpath,/Users/skaji/env/rakudobrew/moar-nom/install/lib
  -Wl,-rpath,/Users/skaji/env/rakudobrew/moar-nom/install/share/perl6/site/lib

But I want to append */Add directories to rpath. How can I do that?

=end pod

class Build is Panda::Builder {
    method build($workdir) {
        mkpath "$workdir/blib/lib/Add"; # we should append Add/ directory?
        make("$workdir/src", "$workdir/blib/lib/Add");
    }
}

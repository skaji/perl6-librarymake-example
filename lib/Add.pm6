use v6;
use NativeCall;
use LibraryMake;

unit module Add;

sub library {
    my $so = get-vars('')<SO>;
    my $libname = "lib/Add/libadd$so";
    for @*INC <-> $inc {
        if $inc ~~ Str {
            $inc ~~ s/^.*\#//;
            return "$inc/$libname" if "$inc/$libname".IO.r;
        }
    }
    die "Unable to find library: $libname";
}

sub add(Int:D, Int:D) returns Int is native(&library) is export { * };

=begin pod

=head1 NAME

Add - minimal example of LibraryMake

=head1 SYNOPSIS

  use Add;

  "2 + 3 = {add(2, 3)}".say; # 2 + 3 = 5

=head1 INSTALL

  panda install git://github.com/shoichikaji/perl6-librarymake-example.git

Note: If you see C</usr/bin/ld: cannot find -lpam> error, then you will need

  sudo apt-get install libpam0g-dev

or something similar.

=head1 DESCRIPTION

Add module shows you a minimal example of L<https://github.com/retupmoca/P6-LibraryMake>.
It's easy!

=head1 COPYRIGHT AND LICENSE

Copyright 2015 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

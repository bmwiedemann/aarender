#!/usr/bin/perl -w
use strict;
use utf8;
binmode(STDOUT, ":utf8");

#print "\033[1mM"; # bold
for my $c (0x2580..0x259f) {
    print chr($c);
    print "M\nM" if ($c+1)%32==0;
}
print "\033[0m\n"; # normal

#!/usr/bin/perl -w
use strict;

print "\033[1mM"; # bold
for my $c (32..126) {
    print chr($c);
    print "M\nM" if ($c+1)%32==0;
}
print "\033[0m\n"; # normal

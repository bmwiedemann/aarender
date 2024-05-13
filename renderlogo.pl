#!/usr/bin/perl -w
use strict;
use Image::Magick;
use lib "lib";
use font;

sub loadimg($)
{ my $filename = shift;
    my $img = new Image::Magick;
    $img->Read($filename);
    my $s = $ENV{SIZE}//415;
    $img->Resize(width=>$s, height=>$s);
    my ($w,$h)=$img->Get('columns','rows');
    my @p=$img->GetPixels(
            width=>$w,
            height=>$h,
            x=>0, 
            y=>0,
            normalize=>"true",
            map=>"R", # we assume black/white/gray so the red portion is the same as green and blue
    );
    return {
        width=>$w,
        height=>$h,
        pixel=>\@p,
    }
}

our $font = loadfont($ENV{FONT}//"bold.huge.png");
our $img = loadimg($ENV{IMG}//"Slowroll-logo.png");
our $gamma = $ENV{GAMMA}//-0.14;

sub trychar($$)
{ my ($start, $char) = @_;
    my $c = $font->{chars}{$char};
    my $match = 0;
    foreach my $rowpix (@$c) {
        my $pos = $start;
        foreach my $pix (@$rowpix) {
            $match -= abs($pix-$img->{pixel}[$pos++]+$gamma)**2;
        }
        $start += $img->{width};
    }
    return $match;
}

my $xn=int($img->{width} / $font->{cwidth});
my $yn=int($img->{height} / $font->{cheight});
print "\033[1m"; # bold
for my $y (0..$yn-1) {
    for my $x (0..$xn-1) {
        my $start = $x * $font->{cwidth} + $y * $font->{cheight} * $img->{width};
        my %best=(match=>-1e10);
        for my $char (sort keys %{$font->{chars}}) {
            my $match = trychar($start, $char);
            if($match > $best{match}) {
                %best = (match=>$match, char=>$char)
            }
        }
        print chr($best{char});
    }
    print "\n";
}
print "\033[0m\n"; # normal

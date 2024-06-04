use Image::Magick;

sub loadfont($)
{ my $filename = shift;
    my $img = new Image::Magick;
    $img->Read($filename);
    my ($w,$h)=$img->Get('columns','rows');
    if(($w%32) != 0  or ($h%3) != 0) {
        die "sanity check failed for $filename"
    }
    my ($cw, $ch) = ($w/32, $h/3); # character pixel width+height
    my @p=$img->GetPixels(
            width=>$w,
            height=>$h,
            x=>0,
            y=>0,
            normalize=>"true",
            map=>"R", # we assume black/white/gray so the red portion is the same as green and blue
    );
    #die "$w $h $cw $ch ". scalar(@p); # debug
    my %char=();
    for my $c (32..126) {
        my $i=$c-32;
        my $y=int($i/32);
        my $x=$i%32;
        my @cp = ();
        for my $row (0..$ch-1) {
            my $start = ($y*$ch + $row)*$w + $x*$cw;
            die "sanity check failed: c=$c i=$i ($y*$ch + $row)*$w + $x*$cw" if($start>$w*$h);
            push @cp, [@p[$start..$start+$cw-1]];
        }
        $char{$c} = \@cp;
    }
    return {
        width=>$w,
        height=>$h,
        cwidth=>$cw,
        cheight=>$ch,
        chars=>\%char,
    }
}


1;

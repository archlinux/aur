#!/usr/bin/perl
require 5.008;

# fmfix.pl v1.0

# Copyright 2015 by Chris Severance aur.severach aATt spamgourmet dott com
# May be distributed under the terms of the GNU Public Licence, V2 or any later version.

# For HylaFAX+, 2015/05/11 Chris Severance for Arch Linux

# Usage: gs -q -sDEVICE=tiffg3 -sFONTPATH=/usr/share/fonts/Type1 /var/spool/hylafax/bin/genfontmap.ps | fmfix.pl > Fontmap.HylaFAX
# Note: gs requires a FONTPATH but completely ignores any fonts contained within.
# All you get is a lousy copy of /usr/share/ghostscript/0.00/Resource/Init/Fontmap.GS mangled by genfontmap.ps
# which could have been obtained much less obtusely with the likes of sed, awk, cut, expr,
# or a crufty perl script similar to this one.

# gsfontmap.ps used to produce all lines with filenames:
# (Hershey-Script-Simplex-Bold) (hrscsb.gsf) ;
# but now for some fonts it just puts the name:
# (Courier) /NimbusMon-Reg ;
# figuring that gs will know how to find them. This totally borks HylaFAX+ TextFormat.c++
# ability to find the associated .afm metrics file so you get an error:
# NimbusMon-Bol: No glyph metric table located...
# To fix this we quit using the new URWfonts which don't have metrics
# and use the old "35" gsfonts which do. They're already in the FONTPATH.
# To make HylaFAX use them specifically we sub in
# the filename instead of the new font name. This change only happens in
# a HylaFAX+ config file so other apps that use ghostscript are not affected.

# Hack-n-slash our way through the "35" Type 1 font files to get the names.
# The .pfb files are of the form:
# 6 hex codes, mostly consistent but might contain a \n
# %!PS-AdobeFont-...: MyFontName ...\n

use strict;
use warnings;
my $gsfolder="/usr/share/fonts/Type1"; # Arch Linux package 'gsfonts'
opendir(GSFONTS, $gsfolder) or die "Can't open directory: $!\n";
my $liner;
my $file;
my %fontxlat;
while ($file = readdir(GSFONTS)) {
  if ($file =~ m/[^.]+\.pfb/ ) {
    open(FONT,"<",$gsfolder."/".$file) or die;
    read (FONT, $liner,6, 0);
    $liner = <FONT>;
    if ( $liner =~ m/%!PS-AdobeFont[^:]+: ([^ ]+) /) {
      #print "$file = $1\n"
      $fontxlat{$1}=$file;
    }
    close(FONT);
  }
}
closedir(GSFONTS);

#open(FONTMAP,"<","Fontmap.HylaFAX") or die;

# Convert all lines of the form
# (BoringFontName)\t/AnotherBoringFontName ;
# to
# (BoringFontName)\t(InterestingFileName.pfb) ;

while($liner = <STDIN>) {
  if ($liner =~ m:^[(]([^)]+)[)]\t/([^ ]+) ;: and $fontxlat{$2} ) {
    print "($1)\t($fontxlat{$2}) ;\n"; #  % fixed by HylaFAX+ $0!
  } else {
    print $liner;
  }
}

#close(FONTMAP);

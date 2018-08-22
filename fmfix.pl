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

# Testing:
#   gs -q -sDEVICE=tiffg3 -sFONTPATH=/usr/share/fonts/Type1 /var/spool/hylafax/bin/genfontmap.ps > fmtest.txt
#   fmfix.pl < fmtest.txt > Fontmap.HylaFAX

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

# Quit changing names!
# This translates from the first line of *.pfb to the second column in the .gs listing
my %brokenxlat=(
  'BookmanURW-DemBol' => 'URWBookman-Demi',
  'BookmanURW-DemBolIta' => 'URWBookman-DemiItalic',
  'BookmanURW-Lig' => 'URWBookman-Light',
  'BookmanURW-LigIta' => 'URWBookman-LightItalic',
  'CenturySchURW-Bol' => 'C059-Bold',
  'CenturySchURW-BolIta' => 'C059-BdIta',
  'CenturySchURW-Ita' => 'C059-Italic',
  'CenturySchURW-Rom' => 'C059-Roman',
  'ChanceryURW-MedIta' => 'Z003-MediumItalic',
  'Dingbats' => 'D050000L',
  'NimbusMono-Bold' => 'NimbusMonoPS-Bold',
  'NimbusMono-BoldOblique' => 'NimbusMonoPS-BoldItalic',
  'NimbusMono-Oblique' => 'NimbusMonoPS-Italic',
  'NimbusMono-Regular' => 'NimbusMonoPS-Regular',
  'NimbusRomNo9L-Med' => 'NimbusRoman-Bold',
  'NimbusRomNo9L-MedIta' => 'NimbusRoman-BoldItalic',
  'NimbusRomNo9L-Reg' => 'NimbusRoman-Italic',
  'NimbusRomNo9L-RegIta' => 'NimbusRoman-Regular',
  'NimbusSanL-Bol' => 'NimbusSans-Bold',
  'NimbusSanL-BolIta' => 'NimbusSans-BoldOblique',
  'NimbusSanL-Reg' => 'NimbusSans-Regular',
  'NimbusSanL-RegIta' => 'NimbusSans-Oblique',
  'NimbusSanNar-Bol' => 'NimbusSansNarrow-Bold',
  'NimbusSanNar-BolIta' => 'NimbusSansNarrow-BdOblique',
  'NimbusSanNar-Ita' => 'NimbusSansNarrow-Oblique',
  'NimbusSanNar-Reg' => 'NimbusSansNarrow-Regular',
# A bad match to Palatino. At least the names have some of the same letters.
  'PalladioURW-Bol' => 'P052-Bold',
  'PalladioURW-BolIta' => 'P052-BoldItalic',
  'PalladioURW-Ita' => 'P052-Italic',
  'PalladioURW-Rom' => 'P052-Roman',
  'StandardSymL' => 'StandardSymbolsPS',
  'URWGothic-Boo' => 'URWGothic-Book',
  'URWGothic-BooObl' => 'URWGothic-BookOblique',
  'URWGothic-Dem' => 'URWGothic-Demi',
  'URWGothic-DemObl' => 'URWGothic-DemiOblique',
);

use strict;
use warnings;
my $gsfolder="/usr/share/fonts/Type1"; # Arch Linux package 'gsfonts-type1'
opendir(GSFONTS, $gsfolder) or die "Can't open directory: $!\n";
my $liner;
my $file;
my %fontxlat;
while ($file = readdir(GSFONTS)) {
  if ($file =~ m/\.pfb$/ ) {
    open(FONT,"<",$gsfolder."/".$file) or die;
    read (FONT, $liner,6, 0); # discard first 6 characters
    $liner = <FONT>;
    close(FONT);
    if ( $liner =~ m/%!PS-AdobeFont[^:]+: ([^ ]+) /) {
      if ($brokenxlat{$1}) {
        $fontxlat{$brokenxlat{$1}}=$file;
      } else {
        #print STDERR "  '$1' => '',\n";
        $fontxlat{$1}=$file;
      }
    } else {
      print STDERR "Not found $file\n";
    }
  }
}
closedir(GSFONTS);
#exit 1;
#open(FONTMAP,"<","Fontmap.HylaFAX") or die;

# Manually translate from the second column to a best match font name
$fontxlat{'ArialMT'}="n019003l.pfb";
$fontxlat{'Arial-BoldMT'}="n019004l.pfb";
$fontxlat{'Arial-BoldItalicMT'}="n019024l.pfb";
$fontxlat{'Arial-ItalicMT'}="n019023l.pfb";
$fontxlat{'TimesNewRomanPSMT'}="n021023l.pfb";
$fontxlat{'TimesNewRomanPS-BoldMT'}="n021004l.pfb";
$fontxlat{'TimesNewRomanPS-BoldItalicMT'}="n021024l.pfb";
$fontxlat{'TimesNewRomanPS-ItalicMT'}="n021003l.pfb";
# Arial looks good to me!
$fontxlat{'Cyrillic-Regular'}="n019003l.pfb";
$fontxlat{'Shareware-Cyrillic-Italic'}="n019023l.pfb";
$fontxlat{'Shareware-Cyrillic-Regular'}="n019003l.pfb";
# Times looks good to me
$fontxlat{'CharterBT-Bold'}="n021004l.pfb";
$fontxlat{'CharterBT-BoldItalic'}="n021024l.pfb";
$fontxlat{'CharterBT-Italic'}="n021003l.pfb";
$fontxlat{'CharterBT-Roman'}="n021023l.pfb";
# Nimbus Sans Lite looks good to me
$fontxlat{'NimbusSans-BoldItalic'}="n019024l.pfb";
$fontxlat{'NimbusSansNarrow-BoldOblique'}="n019064l.pfb"; # an exact match!
$fontxlat{'NimbusSans-Italic'}="n019023l.pfb";

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

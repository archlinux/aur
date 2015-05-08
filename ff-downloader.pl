#!/usr/bin/perl
# ff-downloader v0.5.10.4
## Copyright 2011-15 Simone Sclavi 'Ito'
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

use strict;
use warnings;
use Switch 'Perl6';
use feature 'say';
use Getopt::Long qw(:config no_ignore_case);
use LWP;
use Digest::MD5;
use File::Slurp;
use Env 'HOME';

my $browser;
sub get_url
{
    my ($url, $file) = @_;
    $browser = LWP::UserAgent->new unless $browser;
    $browser->timeout(30);
    $browser->show_progress(1);
    $browser->env_proxy( );
    my $resp = $browser->get($url, ':content_file' => $file);
    return $resp->is_success;
}


sub read_config
{
    my $p = shift;
    my $conf_file = "${HOME}/.ff-downloader";
    my $lang_code;
    if (! -e $conf_file )
    {
        my @file = (
            "# Define here your preferred language(s) for Firefox and Thunderbird.\n",
            "# ff=en-US\n",
            "# tb=en-US\n"
            );
       write_file($conf_file, @file);     
       return
   }
   else
   {
       my @file = read_file($conf_file);
       for my $line(@file)
       {
           chomp $line; $line =~ s/^\s+//; $line =~ s/\s+$//;
           next if $line =~ /^#/;
           if ($line =~ /^$p=([-a-zA-Z]+)$/)
           {
               $lang_code = $1;
           }      
       }
       return $lang_code;
   }
}
my ($VER, $PACKAGE, $LANG);
my $pkg = 'ff'; #default value for "--package"
my $res = GetOptions("version|v=s" => \$VER,
                     "package|p=s" => \$pkg );	

die ":: usage: $0 -p|--package=<package name [ff|tb]> -v|--version=<version number>\n" unless $res and (scalar @ARGV == 0);
given ($pkg)
{
    when ('ff')  { $PACKAGE = 'firefox' }
    when ('tb')  { $PACKAGE = 'thunderbird'}
    default { die qq{:: "$pkg" is not a valid value for "--package"! Please use "ff" or "tb"\n}}  
}
die qq{:: "--version" option is mandatory!\n} unless $VER;
$LANG = read_config($pkg);

if (!$LANG)
{
    my @ff_i18n = (
    { language => 'Acholi', code => 'ach' },
    { language => 'Afrikaans (South Africa)', code => 'af' },
    { language => 'Netherlands Antilles', code => 'an' },
    { language => 'Aarabic', code => 'ar' },
    { language => 'Assamese', code => 'as' },
    { language => 'Asturian', code => 'ast' },
    { language => 'Azerbaijani', code => 'az' },
    { language => 'Belarusian', code => 'be' },
    { language => 'Bulgarian', code => 'bg' },
    { language => 'Bengali (Bangladesh)', code => 'bn-BD' },
    { language => 'Bengali (India)', code => 'bn-IN' },
    { language => 'Breton', code => 'br' },
    { language => 'Bosnian', code => 'bs' },
    { language => 'Catalan', code => 'ca' },
    { language => 'Czech', code => 'cs' },
    { language => 'Welsh', code => 'cy' },
    { language => 'Danish', code => 'da' },
    { language => 'German', code => 'de' },
    { language => 'Lower Sorbian', code => 'dsb' },
    { language => 'Greek', code => 'el' },
    { language => 'English (United Kingdom)', code => 'en-GB' },
    { language => 'English (US)', code => 'en-US' },
    { language => 'English (South African)', code => 'en-ZA' },
    { language => 'Esperanto', code => 'eo' },
    { language => 'Spanish (Argentina)', code => 'es-AR' },
    { language => 'Spanish (Chile)', code => 'es-CL' },
    { language => 'Spanish (Spain)', code => 'es-ES' },
    { language => 'Spanish (Mexico)', code => 'es-MX' },
    { language => 'Estonian', code => 'et' },
    { language => 'Basque', code => 'eu' },
    { language => 'Persian', code => 'fa' },
    { language => 'Fulah', code => 'ff' },
    { language => 'Finnish', code => 'fi' },
    { language => 'French', code => 'fr' },
    { language => 'Frisian', code => 'fy-NL' },
    { language => 'Irish', code => 'ga-IE' },
    { language => 'Gaelic (Scotland)', code => 'gd' },
    { language => 'Galician', code => 'gl' },
    { language => 'Gujarati (India)', code => 'gu-IN' },
    { language => 'Hebrew', code => 'he' },
    { language => 'Hindi', code => 'hi-IN' },
    { language => 'Croatian', code => 'hr' },
    { language => 'Upper Sorbian', code => 'hsb' },
    { language => 'Hungarian', code => 'hu' },
    { language => 'Armenian', code => 'hy-AM' },
    { language => 'Indonesian', code => 'id' },
    { language => 'Icelandic', code => 'is' },
    { language => 'Italian', code => 'it' },
    { language => 'Japanese', code => 'ja' },
    { language => 'Kazakh', code => 'kk' },
    { language => 'Khmer', code => 'km' },
    { language => 'Kannada', code => 'kn' },
    { language => 'Korean', code => 'ko' },
    { language => 'Ligurian', code => 'lij' },
    { language => 'Lithuanian', code => 'lt' },
    { language => 'Latvian', code => 'lv' },
    { language => 'Maithili', code => 'mai' },
    { language => 'Macedonian', code => 'mk' },
    { language => 'Malayalam', code => 'ml' },
    { language => 'Marathi', code => 'mr' },
    { language => 'Malay', code => 'ms' },
    { language => 'Norwegian (Bokmal)', code => 'nb-NO' },
    { language => 'Dutch', code => 'nl' },
    { language => 'Norwegian (Nynorsk)', code => 'nn-NO' },
    { language => 'Oriya', code => 'or' },
    { language => 'Punjabi', code => 'pa-IN' },
    { language => 'Polish', code => 'pl' },
    { language => 'Portuguese (Brazil)', code => 'pt-BR' },
    { language => 'Portuguese (Portugal)', code => 'pt-PT' },
    { language => 'Romansh', code => 'rm' },
    { language => 'Romanian', code => 'ro' },
    { language => 'Russian', code => 'ru' },
    { language => 'Sinhalese', code => 'si' },
    { language => 'Slovak', code => 'sk' },
    { language => 'Slovenian', code => 'sl' },
    { language => 'Songhai', code => 'son' },
    { language => 'Albanian', code => 'sq' },
    { language => 'Serbian', code => 'sr' },
    { language => 'Swahili', code => 'sw' },
    { language => 'Tamil', code => 'ta' },
    { language => 'Telugu', code => 'te' },
    { language => 'Thai', code => 'th' },
    { language => 'Turkish', code => 'tr' },
    { language => 'Ukrainan', code => 'uk' },
    { language => 'Vietnamese', code => 'vi' },
    { language => 'Chinese (Simplified)', code => 'zh-CN' },
    { language => 'Xhosa', code => 'xh' },
    { language => 'Chinese (Traditional)', code => 'zh-TW' },
    { language => 'Uzbek', code => 'uz' },
    );

    my @tb_i18n = (
    { language => 'Aarabic', code => 'ar' },
    { language => 'Asturian', code => 'ast' },
    { language => 'Belarusian', code => 'be' },
    { language => 'Bulgarian', code => 'bg' },
    { language => 'Bengali (Bangladesh)', code => 'bn-BD' },
    { language => 'Breton', code => 'br' },
    { language => 'Catalan', code => 'ca' },
    { language => 'Czech', code => 'cs' },
    { language => 'Danish', code => 'da' },
    { language => 'German', code => 'de' },
    { language => 'Greek', code => 'el' },
    { language => 'English (United Kingdom)', code => 'en-GB' },
    { language => 'English (US)', code => 'en-US' },
    { language => 'Spanish (Argentina)', code => 'es-AR' },
    { language => 'Spanish (Spain)', code => 'es-ES' },
    { language => 'Estonian', code => 'et' },
    { language => 'Basque', code => 'eu' },
    { language => 'Finnish', code => 'fi' },
    { language => 'French', code => 'fr' },
    { language => 'Frisian', code => 'fy-NL' },
    { language => 'Irish', code => 'ga-IE' },
    { language => 'Gaelic (Scotland)', code => 'gd' },
    { language => 'Galician', code => 'gl' },
    { language => 'Hebrew', code => 'he' },
    { language => 'Croatian', code => 'hr' },
    { language => 'Hungarian', code => 'hu' },
    { language => 'Armenian', code => 'hy-AM' },
    { language => 'Indonesian', code => 'id' },
    { language => 'Icelandic', code => 'is' },
    { language => 'Italian', code => 'it' },
    { language => 'Japanese', code => 'ja' },
    { language => 'Korean', code => 'ko' },
    { language => 'Lithuanian', code => 'lt' },
    { language => 'Norwegian (Bokmal)', code => 'nb-NO' },
    { language => 'Dutch', code => 'nl' },
    { language => 'Norwegian (Nynorsk)', code => 'nn-NO' },
    { language => 'Punjabi', code => 'pa-IN' },
    { language => 'Polish', code => 'pl' },
    { language => 'Portuguese (Brazil)', code => 'pt-BR' },
    { language => 'Portuguese (Portugal)', code => 'pt-PT' },
    { language => 'Romansh', code => 'rm' },
    { language => 'Romanian', code => 'ro' },
    { language => 'Russian', code => 'ru' },
    { language => 'Sinhalese', code => 'si' },
    { language => 'Slovak', code => 'sk' },
    { language => 'Slovenian', code => 'sl' },
    { language => 'Albanian', code => 'sq' },
    { language => 'Serbian', code => 'sr' },
    { language => 'Swedish', code => 'sv-SE' },
    { language => 'Tamil (Sri Lanka)', code => 'ta-LK' },
    { language => 'Turkish', code => 'tr' },
    { language => 'Ukrainan', code => 'uk' },
    { language => 'Vietnamese', code => 'vi' },
    { language => 'Chinese (Simplified)', code => 'zh-CN' },
    { language => 'Chinese (Traditional)', code => 'zh-TW' },
    );	
    my @u_i18n;
    ( $pkg eq 'ff' ) ? ( @u_i18n = @ff_i18n ) : (@u_i18n = @tb_i18n );
    my @i18n = sort { $a->{language} cmp $b->{language} } @u_i18n;
    my $size = scalar @i18n;
    print "\n";

    for (my $i = 0; $i < $size; $i++ )
    {
	    say '[', $i + 1, "] $i18n[$i]{language}";
    }

    print "\n:: please select your language (type corresponding number)\n> ";
    my $choice;
    while (  $choice =  <STDIN> )
    {
	    no warnings;
	    chomp $choice;
	    $choice =~ s/^\s+//;
	    $choice =~ s/\s+$//;
	    last if $choice ~~ [ 1 .. $size ];
	    print ":: WRONG SELECTION!\n:: please select your language (type corresponding number)\n> ";
    }	
    $LANG = $i18n[$choice - 1]{code};
    say ":: \"$i18n[$choice - 1]{language}\" selected\n::";
    say qq{:: HINT: put "$pkg=$LANG" (without quotes) in $HOME/.ff-downloader to avoid being asked about your language each time you build the package\n::};
}
my $ARCH = qx(uname -m);
chomp $ARCH;

$| = 1; # turn on autoflush;

my $ff_bz2 = "${PACKAGE}-${VER}.tar.bz2";
my $ff_path = "/pub/${PACKAGE}/releases/${VER}/linux-${ARCH}/${LANG}/${ff_bz2}";
my $ff_url = URI->new('https://ftp.mozilla.org');
my $ff_cdn_url = URI->new('http://releases.mozilla.org');
$ff_url->path($ff_path);
$ff_cdn_url->path($ff_path);
# both URLs host the same files, but the CDN is not reachable via HTTPS


##Downloading firefox##
get_url( $ff_cdn_url, $ff_bz2 ) or die qq(:: ERROR - can't download $ff_bz2\n); 

##downloading md5sums##
$ff_url->path("/pub/${PACKAGE}/releases/${VER}/MD5SUMS");
get_url( $ff_url, 'MD5SUMS' ) or die qq(:: ERROR - can't download MD5SUMS\n); 

## calculating & comparing md5 digest
print ':: verifying MD5 checksum ... '; 

my @md5_file = read_file('MD5SUMS');
my $search_string = "linux-${ARCH}/${LANG}/${ff_bz2}";
my $md5s;
for (@md5_file)
{
    if ($_ =~ /([a-z0-9]+)\s{2}[\.\/]*$search_string/)
    {
        $md5s= $1;
        last;
    }
}
die qq{:: ERROR - can't find a valid MD5 checksum in file 'MD5SUMS'!\n} unless $md5s;

open(FILE, $ff_bz2) or die qq{:: ERROR - can't open "$ff_bz2": $!};
binmode(FILE);
my $digest = Digest::MD5->new->addfile(*FILE)->hexdigest;
close(FILE);

( $digest eq $md5s ) ? say 'DONE' : do {say 'FAILED'; exit 1};


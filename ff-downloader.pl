#!/usr/bin/perl
# ff-downloader v0.6.0.1
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
use Digest::SHA;
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


# Return XDG config dirs by decreasing priority
# The first element always is user's config dir
sub xdg_config_dirs
{
    my @system_dirs = split(':', $ENV{XDG_CONFIG_DIRS} || '/etc/xdg');
    my $user_dir = $ENV{XDG_CONFIG_HOME} || "${HOME}/.config";
    return reverse (@system_dirs, $user_dir);
}


sub read_config
{
    # Retrieve config file

    my @conf_paths = map { "$_/ff-downloader.conf" } xdg_config_dirs;
    # Read config from deprecated path for backwards compatibility
    push @conf_paths, "${HOME}/.ff-downloader";
    my $conf_file;
    foreach my $path (@conf_paths) {
        if (-e $path) {
            $conf_file = $path;
            print "Using config file: $conf_file\n";
            last;
        }
    }

    # Try to read language code from config file
   if ($conf_file)
   {
       my @file = read_file($conf_file);
       my $lang_code;
       for my $line(@file)
       {
           chomp $line; $line =~ s/^\s+//; $line =~ s/\s+$//;
           next if $line =~ /^#/;
           if ($line =~ /^ff=([-a-zA-Z]+)$/)
           {
               $lang_code = $1;
           }
       }
       return $lang_code;
   }
}


my ($VER, $BUILD, $LANG);
my $res = GetOptions("version|v=s" => \$VER);
die ":: usage: $0 -v|--version=<version number>\n" unless $res and (scalar @ARGV == 0);
die qq{:: "--version" option is mandatory!\n} unless $VER;

# Keep the version and build number (when there is one) separate
($VER, $BUILD) = split("rc", $VER);

$LANG = read_config();

if (!$LANG)
{
    my @ff_langs = (
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
    { language => 'Kaqchikel', code => 'cak' },
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
    { language => 'Guarani', code => 'gn' },
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
    { language => 'Georgian', code => 'ka' },
    { language => 'Kabyle', code => 'kab' },
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
    { language => 'Burmese', code => 'my' },
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
    { language => 'Swedish', code => 'sv-SE' },
    { language => 'Tamil', code => 'ta' },
    { language => 'Telugu', code => 'te' },
    { language => 'Thai', code => 'th' },
    { language => 'Turkish', code => 'tr' },
    { language => 'Ukrainan', code => 'uk' },
    { language => 'Urdu', code => 'ur' },
    { language => 'Uzbek', code => 'uz' },
    { language => 'Vietnamese', code => 'vi' },
    { language => 'Xhosa', code => 'xh' },
    { language => 'Chinese (Simplified)', code => 'zh-CN' },
    { language => 'Chinese (Traditional)', code => 'zh-TW' },
    );

    my @langs = sort { $a->{language} cmp $b->{language} } @ff_langs;
    my %langs_hash = map { $_->{code} => $_->{language} } @langs;

    say '';
    say 'CODE    LANGUAGE';
    say '----------------';
    for my $lang (@langs) {
        printf "%-7s %s\n", $lang->{code}, $lang->{language};
    }

    print "\n:: Please select your language (type language code)\n> ";
    my $choice;
    while ( $choice =  <STDIN> )
    {
        chomp $choice;
        $choice =~ s/^\s+//;
        $choice =~ s/\s+$//;
        last if exists($langs_hash{$choice});
        print ":: WRONG SELECTION!\n:: Please select your language (type language code)\n> ";
    }
    $LANG = $choice;
    say qq{:: "$langs_hash{$choice}" selected\n::};
    my ($user_conf_dir,) = xdg_config_dirs;
    say qq{:: HINT: put "ff=$LANG" (without quotes) in $user_conf_dir/ff-downloader.conf to avoid being asked about your language each time you build the package\n::};
}
my $ARCH = qx(uname -m);
chomp $ARCH;

$| = 1; # turn on autoflush;

my $ff_bz2 = "firefox-${VER}.tar.bz2";
my $ff_basepath;
if (!$BUILD) {
    $ff_basepath = "/pub/firefox/releases/${VER}";
} else {
    # build candidate
    $ff_basepath = "/pub/firefox/candidates/${VER}-candidates/build${BUILD}";
}
my $ff_path = "${ff_basepath}/linux-${ARCH}/${LANG}/${ff_bz2}";
my $ff_url = URI->new('https://ftp.mozilla.org');
my $ff_cdn_url = URI->new('http://releases.mozilla.org');
$ff_url->path($ff_path);
$ff_cdn_url->path($ff_path);
# both URLs host the same files, but the CDN is not reachable via HTTPS


##Downloading firefox##
get_url( $ff_cdn_url, $ff_bz2 ) or die qq(:: ERROR - can't download $ff_bz2\n);

##downloading sha512sums##
$ff_url->path("${ff_basepath}/SHA512SUMS");
get_url( $ff_url, 'SHA512SUMS' ) or die qq(:: ERROR - can't download SHA512SUMS\n);

## calculating & comparing sha512 digest
print ':: verifying sha512 checksum ... ';

my @sha512_file = read_file('SHA512SUMS');
my $search_string = "linux-${ARCH}/${LANG}/${ff_bz2}";
my $sha512s;
for (@sha512_file)
{
    if ($_ =~ /([a-z0-9]+)\s{2}[\.\/]*$search_string/)
    {
        $sha512s= $1;
        last;
    }
}
die qq{:: ERROR - can't find a valid SHA512 checksum in file 'SHA512SUMS'!\n} unless $sha512s;

open(FILE, $ff_bz2) or die qq{:: ERROR - can't open "$ff_bz2": $!};
binmode(FILE);
my $digest = Digest::SHA->new(512)->addfile(*FILE)->hexdigest;
close(FILE);

( $digest eq $sha512s ) ? say 'DONE' : do {say 'FAILED'; exit 1};

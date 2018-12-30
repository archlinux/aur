#!/usr/bin/perl

# Autheur: Nicolas Guilloux
# Website: https://nicolasguilloux.eu/
# Email:   novares.x@gmail.com

use strict;
use warnings;


# Send to Hostbin
#
# @parem String Content
#
# @return String URL
sub share {
    open(my $fh, '>', '/var/tmp/report_shadow');
    print $fh $_[0];
    close $fh;

    my $url = `curl -sf --data-binary "@/var/tmp/report_shadow" https://nicolasguilloux.eu/hostbin`;

    system('rm /var/tmp/report_shadow');

    return $url;
}

# ------- Check AppImage ------- #
my $path = '/opt/shadowbeta';
my $isAppImg = 0;

if( $#ARGV > -1 ) {
    if( $ARGV[0] eq '--appimage' ) {
        $path = './opt/shadowbeta';
        $isAppImg = 1;
    }
}


my $return = "Shadow Report";

if( $isAppImg ) { $return .= " (AppImage)"; }

$return .= "\n";

# -------- AppImage version -------- #
if( -f 'shadow-appimage-version' ) {

    # Local version
    open(my $fh, '<:encoding(UTF-8)', 'shadow-appimage-version')
      or die "Could not open file 'shadow-appimage-version' $!";
    my $localVersion = <$fh>;
    chomp $localVersion;

    $return .= "AppImage $localVersion \n";
}

# -------- Distribution information -------- #
$return .= "\n-------------------------------------\n\n";
$return .= `cat /etc/*-release`;
$return .= `uname -mrs`;
$return .= "\n-------------------------------------\n\n";

# -------- Environment -------- #
$return .= 'Environment server: ' . `echo \$XDG_SESSION_TYPE`;
if( index(`groups \$USER`, 'input') == -1 ) {
    $return .= '/!\ The user is not in the "input" group.';
} else {
    $return .= 'The user is in the "input" group.';
}

# -------- Missing libraries -------- #
$return .= "\n\n-------------------------------------\n";
$return .= "          Missing libraries\n";
$return .= "-------------------------------------\n";

$return .= `ldd -v "$path/shadow-beta" | grep "not found"`;
$return .= `ldd -v "$path/resources/app.asar.unpacked/native/linux/Shadow" | grep "not found"`;

# -------- VA-API check -------- #
$return .= "\n-------------------------------------\n";
$return .= "               Vainfo\n";
$return .= "-------------------------------------\n";

if( -f '/usr/bin/vainfo' ) {
    $return .= `vainfo`;

} else {
    $return .= "'vainfo' is not installed.";
}

# -------- Logs -------- #
$return .= "\n-------------------------------------\n";
$return .= "                Logs\n";
$return .= "-------------------------------------\n";

if( -f $ENV{"HOME"} . '/.cache/blade/shadow/shadow.log' ){
    my @logs = split(/Welcome/, `cat ~/.cache/blade/shadow/shadow.log`);
    $return .= 'Welcome' . $logs[-1];

} else {
    $return .= 'Logs not found.';
}

# -------- Send to Hostbin -------- #
print share($return) . "\n";

#! /usr/bin/perl -w

################################################################################
# Replacement updater script for AUR package
################################################################################
use strict;
use Getopt::Long;

my $installer = "";
GetOptions("installer=s" => \$installer);

chdir("/tmp");
system("wget https://aur.archlinux.org/cgit/aur.git/snapshot/cewe-fotowelt.tar.gz -O cewe-fotowelt.tar.gz");
system("tar -xf cewe-fotowelt.tar.gz");
chdir("cewe-fotowelt");

system("mv '$installer' ./");
$installer =~ s!.*/!!;
system("_UPDATING=1 _SETUP_FILE=$installer _RENAME='APPLICATION NAME' makepkg --install --noconfirm --clean");

print "\nHit <ENTER> to close this window.\n";
my $input = <STDIN>;

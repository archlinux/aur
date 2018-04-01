#! /usr/bin/perl -w

################################################################################
# Replacement updater script for AUR package
################################################################################
use strict;
use Getopt::Long;

my $installer = "";

GetOptions("installer=s" => \$installer);

unless ($installer =~ /(cewe-fotoservice|Mein_CEWE_FOTOBUCH)/){
	print "\033[1;31mNo AUR package available for this update ('$installer').\033[0m"
}else{

	my $pkgName = $1 eq 'Mein_CEWE_FOTOBUCH' ? 'cewe-fotobuch' : 'cewe-fotoservice';

	chdir('/tmp');
	system("wget https://aur.archlinux.org/cgit/aur.git/snapshot/$pkgName.tar.gz -O $pkgName.tar.gz");
	system("tar -xvf $pkgName.tar.gz");

	chdir($pkgName);
	system("mv '$installer' ./");
	system('_UPDATING=1 makepkg --install --clean --skipchecksums');
}

print "\nDrücken Sie <ENTER> um dieses Fenster zu schließen.\n";
my $input = <STDIN>;

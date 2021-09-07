# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kygekteampmmp4
pkgver=4.0.0
pkgrel=1
pkgdesc="PocketMine-MP 4 as an Arch/AUR package!"
arch=(x86_64)
url="https://kygekteam.org/pm4"
license=('GPL')
makedepends=('wget')

package() {
	mkdir $pkgdir/kygekteampmmp4
	cd $pkgdir/kygekteampmmp4
	wget https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PMMP-4-PHP-Binary/lastSuccessfulBuild/artifact/Linux/PHP_Linux-x86_64.tar.gz
	tar -xvf PHP_Linux-x86_64.tar.gz
	rm PHP_Linux-x86_64.tar.gz
	wget https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PocketMine-MP-4/lastSuccessfulBuild/artifact/PocketMine-MP.phar
	wget https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PocketMine-MP-4/lastSuccessfulBuild/artifact/start.sh
	chmod +x start.sh	
}

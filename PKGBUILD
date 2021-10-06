# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-data-files-installer
pkgver=10
pkgrel=1
pkgdesc="Launcher for BlueMaxima's Flashpoint with script to install data files"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('GPL3')
depends=('p7zip'
				 'wget')
source=("flashpoint-install-data-files.sh")
sha512sums=('6987c8afd49dbd41fd65625a8807b83c196e8abcbfddbd0a29a2a27cc1cecd621485f6551bf36434b6ee11ac9f2da259d1e63a2ee1546ec9177fc9c4ceb41a76')
install=flashpoint-launcher-bin.install

package(){
	install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files
}

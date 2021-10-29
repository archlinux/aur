# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-data-files-installer
pkgver=10
pkgrel=4
pkgdesc="script to install BlueMaxima's Flashpoint data files"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('GPL3')
depends=('p7zip'
			'wget')
source=("flashpoint-install-data-files.sh")
sha512sums=('29fa68d70ed026df9b9d9469f0d790cd0d74dea91e2fd7f45a680d5d83fcef168c4bd16e938779ccdba7d70fbbed420c6aae75c5fc560d3c6cf1215d5c37300c')
install=flashpoint-launcher-bin.install

package(){
	install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files
}

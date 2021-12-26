# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-data-files-installer
pkgver=10
pkgrel=5
pkgdesc="script to install BlueMaxima's Flashpoint data files"
arch=('x86_64')
url="https://aur.archlinux.org/packages/flashpoint-data-files-installer/"
license=('GPL3')
depends=('p7zip'
		'wget')
source=("flashpoint-install-data-files.sh")
sha512sums=('0435c1f89439eaf08b8f72d4465a62cae4599335afe36c365327262bc6e9663215f026f33f0e41b6ce183280cd304484b07fd6d703e21bbc74d2870c629964cf')
install=flashpoint-launcher-bin.install

package(){
	install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files
}

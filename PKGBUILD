# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-data-files-installer
pkgver=10
pkgrel=3
pkgdesc="script to install BlueMaxima's Flashpoint data files"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('GPL3')
depends=('p7zip'
			'wget')
source=("flashpoint-install-data-files.sh")
sha512sums=('a1c4ebbe58e7a87b4c2269a16ba948db135ebf9480aaf0bf5b6c4344f3059f1ae10392fbc211b125ceb712cef72cae61de219fa98b46ff82a2fd0deaeff74281')
install=flashpoint-launcher-bin.install

package(){
	install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files
}

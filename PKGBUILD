# Maintainer:CTech <ctech.exe@gmail.com>

pkgname=flatabulous
pkgver=16.04
pkgrel=1
pkgdesc="This is a Flat theme for Ubuntu and other Gnome based Linux Systems."
arch=('any')
url="https://blog.anmoljagetia.me/flatabulous-ubuntu-theme/"
license=('MIT')
depends=('gtk3')
source=("$pkgname-$pkgver.deb::https://github.com/anmoljagetia/Flatabulous/releases/download/16.04.1/Flatabulous-Theme.deb")
sha256sums=('3d08ac7713336d4a26198818035bfe81642efb58d57de749bf6505bbb4ad402b')

package() {
	msg2 "Extracting data.tar.gz"
	bsdtar -zxf data.tar.gz -C "$pkgdir"
	msg2 "Changing some permissions"
	cd "$pkgdir/"
	chmod -R 755 usr
}

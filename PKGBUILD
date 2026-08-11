# Maintainer: thorou <thorou@chirality.de>

_pkgname=rolr
pkgname=$_pkgname-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Host role manager built on top of ansible"
arch=("x86_64")
url="https://github.com/thorio/rolr"
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$url/releases/download/v$pkgver/rolr-x86_64.pkg.tar.zst")
sha256sums=("4c26ddddfec06634994449511c4b10377d2d68f6c4bfa30584053c77478ce04d")

package() {
	cp -ar usr $pkgdir/usr
}

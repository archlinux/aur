# Maintainer: thorou <thorou@chirality.de>

_pkgname=rolr
pkgname=$_pkgname-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Host role manager built on top of ansible"
arch=("x86_64")
url="https://github.com/thorio/rolr"
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$url/releases/download/v$pkgver/rolr-x86_64.pkg.tar.zst")
sha256sums=("bb811c3fe2541fe9ee0f09e13cc9f66eb71fe63e76e6e4766b81e3abb90e1811")

package() {
	cp -ar usr $pkgdir/usr
}

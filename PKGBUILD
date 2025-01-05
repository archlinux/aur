# Maintainer: thorou <thorou@chirality.de>

_pkgname=rolr
pkgname=$_pkgname-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Host role manager built on top of ansible"
arch=("x86_64")
url="https://github.com/thorio/rolr"
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$url/releases/download/v$pkgver/rolr-x86_64.pkg.tar.zst")
sha256sums=("c8dc7fb0ff9042e9f1376bcd9ed926adb82eb629959de858787407af9cccf2a2")

package() {
	cp -ar usr $pkgdir/usr
}

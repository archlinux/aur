# Maintainer: thorou <thorou@chirality.de>

_pkgname=rolr
pkgname=$_pkgname-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Host role manager built on top of ansible"
arch=("x86_64")
url="https://github.com/thorio/rolr"
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$url/releases/download/v$pkgver/rolr-x86_64.pkg.tar.zst")
sha256sums=("19e35bf0067ac7fc118a9f597f64fe215925561d183f3962e9725ce317428209")

package() {
	cp -ar usr $pkgdir/usr
}

# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname="nob.h"
pkgver=3.7.0
pkgrel=1
pkgdesc="Header only library for writing build recipes in C"
arch=('any')
url="https://github.com/tsoding/${pkgname}"
license=('MIT')
depends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("nob.h-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9186ab49efe3bed5742bf17579c82dd2a012583760ef208e42e30e83528f628f')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 nob.h -t "$pkgdir/usr/include"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

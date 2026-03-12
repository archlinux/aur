# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname="nob.h"
pkgver=3.4.0
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
sha256sums=('47aa85324da33c5a45d81b987297a82d31b578486dddea4d4e794a7b7dbbf7d6')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 nob.h -t "$pkgdir/usr/include"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

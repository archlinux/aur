# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname="nob.h"
pkgver=3.8.0
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
sha256sums=('a82283e3faec5d49b614287e496acceb6a94b294d1686b358f1da2c7e4b016fe')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 nob.h -t "$pkgdir/usr/include"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

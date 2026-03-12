# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname="nob.h"
pkgver=3.5.0
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
sha256sums=('2ceba23a21cbe9eae803aed73e642b216a2e0b2c9cfc9ae9a0f9500bca0378af')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 nob.h -t "$pkgdir/usr/include"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

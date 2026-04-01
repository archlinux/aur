# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# https://github.com/stiermid/aur-pkgbuilds

pkgname="nob.h"
pkgver=3.8.2
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
sha256sums=('7133b1cf34bf432088b9a9959ca07cae7da63eac134cf25bb08d49796b88f09f')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 nob.h -t "$pkgdir/usr/include"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

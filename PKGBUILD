# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lua-succulent
_pkg="${pkgname#lua-}"
pkgver=0.1.0
pkgrel=1
pkgdesc="Lua functions and utilities for Hilbish"
arch=('any')
url="https://github.com/rosettea/succulent"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a76aa3050bfc03b728c9181eb26ca84c19b2ff6a75facdb10a184dea4c6a97e2')
# validpgpkeys=('098F50DFBCEEC71A4EAB6DA450EE40A2809851F5')

package() {
	cd "${_pkg^}-$pkgver"
	install -Dvm644 init.lua -t "$pkgdir/usr/share/hilbish/libs/succulent/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}


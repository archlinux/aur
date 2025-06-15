# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=authelia-runit
pkgver=20250615
pkgrel=1
pkgdesc="Runit service script for authelia."
arch=("any")
url="https://github.com/authelia/authelia"
license=("Apache-2.0")
depends=("authelia" "runit")
source=("authelia.run")
sha256sums=(SKIP)

package() {
	cd "$srcdir"
	install -Dm755 authelia.run "$pkgdir/etc/runit/sv/authelia/run"
}

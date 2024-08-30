# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=forgejo-runit
pkgver=20240830
pkgrel=1
pkgdesc="Runit service script for forgejo"
arch=("any")
url="https://forgejo.org"
license=("MIT")
depends=("forgejo" "runit")
source=("forgejo.run")
sha256sums=('c237f8d9a84ce0e6f23caf2fbedb20e4c5af63578995079953b5d81edc33330b')

package() {
	cd "$srcdir"
	install -Dm755 forgejo.run "$pkgdir/etc/runit/sv/forgejo/run"
}

# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=seerr-runit
pkgver=20260722
pkgrel=2
pkgdesc="Runit service script for seerr."
arch=("any")
url="https://github.com/seerr-team/seerr"
license=("MIT")
depends=("seerr" "runit")
source=("seerr.run")
sha256sums=('73adc79dbcf96b8b891122542867ce3009d0b00308662cde38b2eb38cc5ae623')

package() {
	cd "$srcdir"
	install -Dm755 seerr.run "$pkgdir/etc/runit/sv/seerr/run"
}

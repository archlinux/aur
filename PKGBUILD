# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=seerr-runit
pkgver=20260722
pkgrel=1
pkgdesc="Runit service script for seerr."
arch=("any")
url="https://github.com/seerr-team/seerr"
license=("MIT")
depends=("seerr" "runit")
source=("seerr.run")
sha256sums=('935477c9dc3928022f47d53fb5ce55390d3bc71d7cc365800b3a96ac690994ba')

package() {
	cd "$srcdir"
	install -Dm755 seerr.run "$pkgdir/etc/runit/sv/seerr/run"
}

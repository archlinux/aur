# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=seerr-runit
pkgver=20251126
pkgrel=1
pkgdesc="Runit service script for seerr."
arch=("any")
url="https://github.com/seerr-team/seerr"
license=("MIT")
depends=("seerr" "runit")
source=("seerr.run")
sha256sums=('94a32bdaf60aab03f2b9c82d478eb978e8471f82a24b87ff66836fe0241ae2c3')

package() {
	cd "$srcdir"
	install -Dm755 seerr.run "$pkgdir/etc/runit/sv/seerr/run"
}

# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=bazarr-runit
pkgver=20240422
pkgrel=1
pkgdesc="Runit service script for bazarr."
arch=("any")
url="https://bazarr.media"
license=("GPL-3.0")
depends=("bazarr" "runit")
install=bazarr.install
source=("bazarr.run")
sha256sums=('7232c3971621d3afa8f8377fee91c10e27eb7e1184861d96708906cfeccfd7f0')

package() {
	cd "$srcdir"
	install -Dm755 bazarr.run "$pkgdir/etc/runit/sv/bazarr/run"
}

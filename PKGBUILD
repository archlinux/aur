# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=prowlarr-runit
pkgver=20240422
pkgrel=1
pkgdesc="Runit service script for prowlarr."
arch=("any")
url="https://prowlarr.com"
license=("GPL-3.0")
depends=("prowlarr" "runit")
source=("prowlarr.run")
sha256sums=('d0fbe3e5f0542f2960234560dc678356e4aaa74b37714673fd471e2aa16fc4ae')

package() {
	cd "$srcdir"
	install -Dm755 prowlarr.run "$pkgdir/etc/runit/sv/prowlarr/run"
}

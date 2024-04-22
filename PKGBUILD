# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=sonarr-runit
pkgver=20240422
pkgrel=1
pkgdesc="Runit service script for sonarr."
arch=("any")
url="https://sonarr.tv"
license=("GPL-3.0")
depends=("sonarr" "runit")
source=("sonarr.run")
sha256sums=('aca6062b6142c2c0b2e86c8ae241c6c4a48df813cf0f06e4067258bf4c551d12')

package() {
	cd "$srcdir"
	install -Dm755 sonarr.run "$pkgdir/etc/runit/sv/sonarr/run"
}

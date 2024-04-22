# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=jellyseerr-runit
pkgver=20240422
pkgrel=1
pkgdesc="Runit service script for jellyseerr."
arch=("any")
url="https://github.com/Fallenbagel/jellyseerr"
license=("MIT")
depends=("jellyseerr" "runit")
source=("jellyseerr.run")
sha256sums=('a38cb12a18141009fb930eade546f8c47b66cd34312072b816af33b76eeff2d6')

package() {
	cd "$srcdir"
	install -Dm755 jellyseerr.run "$pkgdir/etc/runit/sv/jellyseerr/run"
}

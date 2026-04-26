# Maintainer: zacoons <zac@zacoons.com>

pkgname=dnss-dinit
pkgver=0.1.0
pkgrel=0
pkgdesc="Dinit script for dnss."
arch=(any)
url="https://codeberg.org/zacoons/dnss"
license=("Unlicense")
depends=("dnss")

source=("dnss.service" "dnss.conf")

b2sums=("SKIP" "SKIP")

package() {
	cd "$srcdir"
	install -Dm 644 "dnss.service" "$pkgdir/etc/dinit.d/dnss"
	install -Dm 644 "dnss.conf" "$pkgdir/etc/dnss.conf"
}

# Maintainer: zacoons <zac@zacoons.com>

pkgname=dnss-openrc
pkgver=0.1.0
pkgrel=0
pkgdesc="OpenRC script for dnss."
arch=(any)
url="https://codeberg.org/zacoons/dnss"
license=("Unlicense")
depends=("dnss")

source=("dnss.service" "dnss.conf")

b2sums=("SKIP" "SKIP")

package() {
	cd "$srcdir"
	install -Dm 755 "dnss.service" "$pkgdir/etc/init.d/dnss"
	install -Dm 644 "dnss.conf" "$pkgdir/etc/dnss.conf"
}

# Maintainer: zacoons <zac@zacoons.com>

pkgname=dnss-systemd
pkgver=0.1.0
pkgrel=0
pkgdesc="Systemd script for dnss."
arch=(any)
url="https://codeberg.org/zacoons/dnss"
license=("Unlicense")
depends=("dnss")

source=("dnss.service" "dnss.sysusers" "example.dnss.conf")

b2sums=("SKIP" "SKIP" "SKIP")

package() {
	cd "$srcdir"
	install -Dm 644 "dnss.service" "$pkgdir/usr/lib/systemd/system/dnss.service"
	install -Dm 644 "dnss.sysusers" "$pkgdir/usr/lib/sysusers.d/dnss.conf"
	install -Dm 644 "example.dnss.conf" "$pkgdir/etc/dnss.conf"
}

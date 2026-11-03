# Maintainer: zacoons <zac@zacoons.com>

pkgname=yggdrasil-dinit
pkgver=20261030
pkgrel=1
pkgdesc="Dinit script for Yggdrasil."
arch=(any)
url=https://yggdrasil-network.github.io/
license=(Unlicense)
depends=(yggdrasil)

source=(sysusers service)

b2sums=(SKIP SKIP)

package() {
	cd "$srcdir"
	install -Dm 644 sysusers "$pkgdir/usr/lib/sysusers.d/yggdrasil-dinit.conf"
	install -Dm 644 service "$pkgdir/etc/dinit.d/yggdrasil"
}

# Maintainer: Maxim Devaev <mdevaev@gmail.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


pkgname=raspberrypi-io-access
pkgver=0.1
pkgrel=1
pkgdesc="Raspberry Pi port access rules and groups"
url=""
license=(GPL)
arch=(any)
install=raspberrypi-io-access.install


source=(raspberrypi-io-access.install udev.rules)
md5sums=(
	"c737d24aa94fefc4b93b6fdbf5a5e85b"
	"5396ffc35d284c072fa38534840d5d6f"
)


package() {
	install -Dm644 udev.rules "$pkgdir/etc/udev/rules.d/95-raspberrypi-io-access.rules"
}

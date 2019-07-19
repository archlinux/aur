# Maintainer: Maxim Devaev <mdevaev@gmail.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


pkgname=raspberrypi-io-access
pkgver=0.2
pkgrel=1
pkgdesc="Raspberry Pi port access rules and groups"
url=""
license=(GPL)
arch=(any)
install=raspberrypi-io-access.install


source=(raspberrypi-io-access.install udev.rules)
md5sums=(SKIP SKIP SKIP)


package() {
	install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/raspberrypi-io-access.conf"
	install -Dm644 udev.rules "$pkgdir/etc/udev/rules.d/95-raspberrypi-io-access.rules"
}

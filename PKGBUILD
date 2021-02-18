# Maintainer: Atif <iftakhar.awal@gmail.com>

pkgname=sd-zram
pkgver=2.0
pkgrel=2
pkgdesc="Enable zram on boot"
arch=('any')
depends=('bash')
backup=("etc/sd-zram.conf")
url="https://github.com/AtifChy/sd-zram"
source=("sd-zram.conf"
	"sd-zram"
	"sd-zram.service")
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')

package() {
	install -Dm644 sd-zram.conf "$pkgdir/etc/sd-zram.conf"
	install -Dm755 sd-zram "$pkgdir/usr/lib/systemd/scripts/sd-zram"
	install -Dm644 sd-zram.service "$pkgdir/usr/lib/systemd/system/sd-zram.service"
}


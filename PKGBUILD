# Maintainer: David P. <megver83@parabola.nu>

pkgname=udisks2-openrc
pkgver=20170521
pkgrel=1
pkgdesc="OpenRC udisks2 init script"
arch=(any)
url="https://www.parabola.nu"
license=('GPL2')
depends=('udisks2' 'openrc')
source=("udisks2.initd")
md5sums=('9add7dad78d93cbe2fcf4582cc7ce069')

pkgver() {
	date +%Y%m%d
}

package() {
    install -Dm755 udisks2.initd $pkgdir/etc/init.d/udisks2
}

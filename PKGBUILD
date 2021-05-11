# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-systemd
pkgver=20210510
pkgrel=2
pkgdesc="g15daemon init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'systemd')
_filename='g15daemon.service'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.service")
sha256sums=('2723465ba726a4675d442fdb3068353def37bc70ce84cdab6c65f1c450c1dc4a')

pkgver() {
   date +%Y%m%d
}

package() {
install -D -m 644 "g15daemon.service" "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
}

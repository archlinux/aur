# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-systemd
pkgver=20210420
pkgrel=1
pkgdesc="g15daemon init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'systemd')
_filename='g15daemon.service'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.service")
sha256sums=('116bf25638f14b46e380cda0ecc0a85c3403f6d3d5640e4aaf980ea1ddf24ad0')

pkgver() {
   date +%Y%m%d
}

package() {
install -D -m 644 "g15daemon.service" "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
}

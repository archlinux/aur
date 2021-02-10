# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-openrc
pkgver=20210210
pkgrel=1
pkgdesc="g15daemon init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'openrc')
_filename='g15daemon.initd'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/init/openrc/g15daemon.initd")
sha256sums=('3fad6371f206be83cbaa9b904f494bbe7828d1da6ef5ec3ea202bc5959f2b402')

pkgver() {
   date +%Y%m%d
}

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -Dm755 "$srcdir/$_service.initd" "$pkgdir/etc/init.d/$_service"
}

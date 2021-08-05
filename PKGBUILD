# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-openrc
pkgver=20210805
pkgrel=2
pkgdesc="g15daemon init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'openrc')
_filename='g15daemon.initd'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.openrc")
sha256sums=('3fad6371f206be83cbaa9b904f494bbe7828d1da6ef5ec3ea202bc5959f2b402')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -Dm755 "$srcdir/g15daemon.openrc" "$pkgdir/etc/init.d/g15daemon"
}

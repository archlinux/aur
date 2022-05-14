# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15daemon-openrc
pkgver=20210805
pkgrel=3
pkgdesc="g15daemon init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'openrc')
_filename='g15daemon.initd'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.openrc")
sha256sums=('fc8697cdb8b0823c737ab19df382162f5fb055c9ada1b917deeb75457255fb05')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -Dm755 "$srcdir/g15daemon.openrc" "$pkgdir/etc/init.d/g15daemon"
}

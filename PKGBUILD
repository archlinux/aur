# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-runit
pkgver=20210211
pkgrel=3
pkgdesc="g15daemon init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15daemon.run'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.run")
sha256sums=('9e4f995ffe2edbd28aeaf36e3f0fc4d9a1d523f8be29f46df57b658fc39d3e9b')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15daemon.run" "$pkgdir/etc/runit/sv/g15daemon/run"
}


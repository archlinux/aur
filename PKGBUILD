# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-runit
pkgver=20211229
pkgrel=1
pkgdesc="g15daemon init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15daemon.run'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.run")
sha256sums=('5bdb759fde465824cbcf8c05241afbfc65d87e999af57c5c07f1fbb298e53c40')

package() {
   install -Dm755 "$srcdir/g15daemon.run" "$pkgdir/etc/runit/sv/g15daemon/run"
}


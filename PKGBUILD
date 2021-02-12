# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-runit
pkgver=20210212
pkgrel=1
pkgdesc="g15daemon init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15daemon.run'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.run")
sha256sums=('451632c6e2c33182cc9081eaf86cd10af1797f425375cf81756516ee1f0a1550')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15daemon.run" "$pkgdir/etc/runit/sv/g15daemon/run"
}


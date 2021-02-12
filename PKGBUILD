# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-runit
pkgver=20210212
pkgrel=1
pkgdesc="g15stats init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15stats.run'
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.run")
sha256sums=('c87da94a31b2c8ff35aeb8f5801c3615ffa69bad46ecd5476cc575e33b853bc4')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15stats.run" "$pkgdir/etc/runit/sv/g15stats/run"
}


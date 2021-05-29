# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-runit
pkgver=20210529
pkgrel=1
pkgdesc="g15stats init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15stats.run'
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.run")
sha256sums=('4860d43f7104eddf3b9440295171a2c9b4d31b3398789a5adfb684d38c8e6351')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15stats.run" "$pkgdir/etc/runit/sv/g15stats/run"
}


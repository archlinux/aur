# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-runit
pkgver=20210211
pkgrel=2
pkgdesc="g15stats init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'runit')
_filename='g15stats.run'
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.run")
sha256sums=('13862bb512df71d76d68379b41b890b3793cdb9d37e7210c3dbfd24c538af050')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15stats.run" "$pkgdir/etc/runit/sv/g15stats/run"
}


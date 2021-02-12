# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-runit
pkgver=20210211
pkgrel=1
pkgdesc="g15daemon init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15daemon.run'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.run")
sha256sums=('27be8c2dfa6b4b09203b783b64615947434087d405363141b62dd12bdb17bad6')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}


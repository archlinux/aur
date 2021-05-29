# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15daemon-runit
pkgver=20210529
pkgrel=1
pkgdesc="g15daemon init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'runit')
_filename='g15daemon.run'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.run")
sha256sums=('375d128586863069f01102f17ec9306769b19256ee9da4e7654c4eb82e92f2ac')

pkgver() {
   date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/g15daemon.run" "$pkgdir/etc/runit/sv/g15daemon/run"
}


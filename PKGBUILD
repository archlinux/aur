# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=anbox-image
pkgver=2
_pkgdate=2017/07/07
pkgrel=1
epoch=1
pkgdesc="Android image for running in Anbox"
arch=('x86_64')
url="http://anbox.io/"
license=('custom')
source=("http://build.anbox.io/android-images/${_pkgdate}/android_${pkgver}_amd64.img")
sha256sums=('48375f2753319a206743f3cbbdfe2f2e063385f1d0484cd66740939b1258de77')

package() {
  install -Dm 644 $srcdir/android_${pkgver}_amd64.img $pkgdir/var/lib/anbox/android.img
}

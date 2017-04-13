# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=anbox-image
pkgver=2017.04.12
_pkgver=2017/04/12
pkgrel=1
pkgdesc="Android image for running in Anbox"
arch=('x86_64')
url="http://anbox.io/"
license=('custom')
source=("http://build.anbox.io/android-images/${_pkgver}/android_1_amd64.img")
sha256sums=('9784841c382957f0581d05dacc5f43f11c347dd7daecefdeedbfcb6d9ff96bee')

package() {
  install -Dm 644 $srcdir/android_1_amd64.img $pkgdir/var/lib/anbox/android.img
}

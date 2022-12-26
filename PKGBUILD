# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=anbox-image-aosa
pkgver=20180719
pkgrel=1
epoch=1
pkgdesc="Android image for running in Anbox from AkihiroSuda mirror"
arch=('x86_64')
url="https://github.com/AkihiroSuda/anbox-android-images-mirror"
license=('custom')
source=("https://github.com/AkihiroSuda/anbox-android-images-mirror/releases/download/snapshot-${pkgver}/android_amd64.img")
sha256sums=('6b04cd33d157814deaf92dccf8a23da4dc00b05ca6ce982a03830381896a8cca')

package() {
  install -Dm 644 $srcdir/android_amd64.img $pkgdir/var/lib/anbox/android.img
}

# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
pkgname=esp32ulp-elf-binutils-bin
pkgver=d2ae637d
pkgrel=1
pkgdesc="Binutils fork with support for the ESP32 ULP co-processor"
arch=('x86_64')
depends=('glibc')
url="https://esp-idf.readthedocs.io/en/latest/api-guides/ulp.html"
source=("https://dl.espressif.com/dl/esp32ulp-elf-binutils-linux64-d2ae637d.tar.gz")
license=('GPL')
options=(!strip staticlibs)
sha256sums=('265105b1f2592468b539033503abe2d862d7448208f0decec1543fb841f2a8d5')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/esp32ulp-elf-binutils/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/share/locale
  rm -rf $pkgdir/usr/share/info
}

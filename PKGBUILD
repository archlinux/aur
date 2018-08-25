# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
pkgname=esp32ulp-elf-binutils-bin
pkgver=2.28.51.20180809
pkgrel=1
pkgdesc="Binutils fork with support for the ESP32 ULP co-processor"
arch=('x86_64')
depends=('glibc')
url="https://esp-idf.readthedocs.io/en/latest/api-guides/ulp.html"
source=("https://github.com/espressif/binutils-esp32ulp/releases/download/v2.28.51-esp32ulp-20180809/binutils-esp32ulp-linux64-2.28.51-esp32ulp-20180809.tar.gz")
license=('GPL')
options=(!strip staticlibs)
sha256sums=('c1bbcd65e1e30c7312a50344c8dbc70c2941580a79aa8f8abbce8e0e90c79566')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/esp32ulp-elf-binutils/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/share/locale
  rm -rf $pkgdir/usr/share/info
}

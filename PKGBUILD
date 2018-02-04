# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: 2bluesc <2bluesc gmail.com>
# Contributor: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-xtensa-esp32-elf-bin
pkgver=1.22.0_80_g6c4433a_5.2.0
pkgrel=1
pkgdesc="ESP32 Toolchain"
arch=('x86_64')
depends=('glibc')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
source=("https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('3fe96c151d46c1d4e5edc6ed690851b8e53634041114bad04729bc16b0445156')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
}

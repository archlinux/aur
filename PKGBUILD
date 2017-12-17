# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: 2bluesc <2bluesc gmail.com>
# Contributor: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-xtensa-esp32-elf-bin
pkgver=1.22.0_75_gbaf03c2_5.2.0
pkgrel=1
pkgdesc="ESP32 Toolchain"
arch=('x86_64')
depends=('glibc')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
source=("https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-75-gbaf03c2-5.2.0.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('c65a719545b773149cad7008c618053443f57a9c15e4ad60877ccce0a5eef82a')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
}

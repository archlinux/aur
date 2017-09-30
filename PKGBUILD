# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: 2bluesc <2bluesc gmail.com>
# Contributor: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-xtensa-esp32-elf-bin
pkgver=1.22.0_73_ge28a011_5.2.0
pkgrel=1
pkgdesc="ESP32 Toolchain"
arch=('x86_64')
depends=('glibc')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
source=("https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-73-ge28a011-5.2.0.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('3763dbed9fd43901c07757622e9c46d29e89eda812b83627df5cb9d019cae0e5')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
}

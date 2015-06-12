# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/archlinux-pkgbuild

pkgname=brackets-lib
pkgver=1
pkgrel=3
pkgdesc="Necessary libs to build Adobe Brackets"
arch=('i686' 'x86_64')
url="http://brackets.io"
license=('MIT')
depends=('nss' 'nspr' 'libudev0')
conflicts=()

package() {
  mkdir -p ${pkgdir}/usr/lib
  
  if [ ! -f /usr/lib/libnss3.so.1d ]; then
    ln -s /usr/lib/libnss3.so ${pkgdir}/usr/lib/libnss3.so.1d
  fi
  if [ ! -f /usr/lib/libnssutil3.so.1d ]; then
    ln -s /usr/lib/libnssutil3.so ${pkgdir}/usr/lib/libnssutil3.so.1d
  fi
  if [ ! -f /usr/lib/libnspr4.so.0d ]; then
    ln -s /usr/lib/libnspr4.so ${pkgdir}/usr/lib/libnspr4.so.0d
  fi
  if [ ! -f /usr/lib/libplc4.so.0d ]; then
    ln -s /usr/lib/libplc4.so ${pkgdir}/usr/lib/libplc4.so.0d
  fi
  if [ ! -f /usr/lib/libsmime3.so.1d ]; then
    ln -s /usr/lib/libsmime3.so ${pkgdir}/usr/lib/libsmime3.so.1d
  fi
#  if [ ! -f /usr/lib/libudev.so.0 ]; then
#    ln -s /usr/lib/libudev.so ${pkgdir}/usr/lib/libudev.so.0
#  fi
}


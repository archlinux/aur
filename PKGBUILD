# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.4.1
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
source=("http://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('805fdc85d5a4c295e793676387593c68')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake.qch "$pkgdir/usr/share/doc/qt"
}

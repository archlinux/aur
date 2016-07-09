# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.6.0
pkgrel=2
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
source=("https://www.cmake.org/cmake/help/v${pkgver:0:3}/CMake.qch")
md5sums=('1b368c3dbe690792c5b2b97f8f87da9d')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake.qch "$pkgdir/usr/share/doc/qt"
}

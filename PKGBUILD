# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.5.2
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
source=("https://www.cmake.org/cmake/help/v${pkgver:0:3}/CMake.qch")
md5sums=('63403f8d30fab7acb8485096eeb85074')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake.qch "$pkgdir/usr/share/doc/qt"
}

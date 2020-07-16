# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.18.0
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
# rename to include version of each release
# (prevents accidentally using the file of an older version)
source=("CMake-$pkgver.qch::https://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('45ccde6188654c92531cf40ede70ac4f')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake-$pkgver.qch "$pkgdir/usr/share/doc/qt"
}

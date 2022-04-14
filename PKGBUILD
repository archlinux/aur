# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.23.1
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='https://cmake.org/documentation'
# rename to include version of each release
# (prevents accidentally using the file of an older version)
source=("CMake-$pkgver.qch::https://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('6679ae7324e3659fd2e2ca1d3faf8f94')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp -v "$srcdir"/CMake-$pkgver.qch "$pkgdir/usr/share/doc/qt/CMake.qch"
}

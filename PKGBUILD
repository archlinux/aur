# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.24.2
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='https://cmake.org/documentation'
# rename to include version of each release
# (prevents accidentally using the file of an older version)
source=("CMake-$pkgver.qch::https://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('285c58f6e3be02ee3919554c66104a38')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp -v "$srcdir"/CMake-$pkgver.qch "$pkgdir/usr/share/doc/qt/CMake.qch"
}

# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.16.2
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
# rename to include version of each release
# (prevents accidentally using the file of an older version)
source=("CMake-$pkgver.qch::https://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('70af4bb75614caf9930d63599018cb00')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake-$pkgver.qch "$pkgdir/usr/share/doc/qt"
}


pkgname=cmake-doc-qch
pkgver=3.3.2
pkgrel=1

pkgdesc="CMake documentation in Qt Help format"
arch=('any')
url='http://www.cmake.org/documentation/'
license=('CCPL:cc-by')
source=("http://www.cmake.org/cmake/help/v${pkgver%.*}/CMake.qch")
md5sums=('16e2c015f15d71d0d1600391b6e83d3d')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/CMake.qch "$pkgdir/usr/share/doc/qt"
}

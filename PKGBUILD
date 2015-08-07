
pkgname=cmake-doc-qch
pkgver=3.3
pkgrel=1

pkgdesc="CMake documentation in Qt Help format"
arch=('any')
url='http://www.cmake.org/documentation/'
license=('CCPL:cc-by')
source=("http://www.cmake.org/cmake/help/v${pkgver}/CMake.qch")
md5sums=('73e97aaa2dbcda003b449c101661ad72')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/CMake.qch "$pkgdir/usr/share/doc/qt"
}

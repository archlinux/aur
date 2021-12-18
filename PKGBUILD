# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=cmake-modules-libr
pkgver=1.4.1717
pkgrel=1
pkgdesc='CMake module for libR (Extracted from rstudio)'
arch=(any)
url="https://github.com/rstudio/rstudio/blob/master/cmake/modules/FindLibR.cmake"
license=('AGPL')
depends=(cmake)
source=("FindLibR-$pkgver.cmake::https://github.com/rstudio/rstudio/raw/v$pkgver/cmake/modules/FindLibR.cmake")
sha256sums=('5e7623aad410fa1852d09bc21057263947e85a3003e596ad23932ba329e54452')

package() {
	install -Dm644 "$srcdir/FindLibR-$pkgver.cmake" "$pkgdir/usr/share/cmake/Modules/FindLibR.cmake"
}

pkgname=spectra
pkgver=1.2.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('fdfccacba1c77d9b4ffefae7258c760c99e3c8a2823ca87ea5b11a50d297a73b')

package() {
  cd spectra-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make install DESTDIR="$pkgdir"
}

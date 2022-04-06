pkgname=spectra
pkgver=1.0.1
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('919e3fbc8c539a321fd5a0766966922b7637cc52eb50a969241a997c733789f3')

package() {
  cd spectra-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make install DESTDIR="$pkgdir"
}

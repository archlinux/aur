pkgname=spectra
pkgver=1.1.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('d29671e3d1b8036728933cadfddb05668a3cd6133331e91fc4535a9b85bedc79')

package() {
  cd spectra-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make install DESTDIR="$pkgdir"
}

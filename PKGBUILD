pkgname=spectra
pkgver=1.0.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('45228b7d77b916b5384245eb13aa24bc994f3b0375013a8ba6b85adfd2dafd67')

package() {
  cd spectra-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make install DESTDIR="$pkgdir"
}

pkgname=spectra
pkgver=0.8.1
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems"
license=('MPL2')
arch=('x86_64')
url="https://spectralib.org/"
depends=('eigen')
makedepends=('cmake')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('339ae9221309a128b8d937ca59b77d9b30aeceacb4ef2d2df13f6f7cde7fa3f3')

package() {
  cd spectra-$pkgver
  install -d "$pkgdir"/usr/
  cp -r include "$pkgdir"/usr
}

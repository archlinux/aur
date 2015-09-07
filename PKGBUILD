# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cusp
pkgver=0.4.0
pkgrel=1
pkgdesc="A C++ Templated Sparse Matrix Library"
arch=('any')
url='http://cusplibrary.github.io'
license=('Apache')
makedepends=()
depends=('cuda')

_dir="cusplibrary-${pkgver}"
source=("https://github.com/cusplibrary/cusplibrary/archive/v${pkgver}.tar.gz")
sha256sums=('8bfcef7fd281bffd53865d74b53cdc69747390c47901a0402bac76cd6442ecda')

package() {
  cd "${srcdir}/${_dir}"

  # Install headers
  install -d "${pkgdir}/opt/cuda/include/cusp"
  cp -r "cusp" "${pkgdir}/opt/cuda/include"
}

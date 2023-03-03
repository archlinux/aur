# Maintainer: robertfoster
pkgname=python-osadl-matrix
pkgver=2023.03.03.030339
pkgrel=1
pkgdesc="OSADL license compatibility matrix as a CSV"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/priv-kweihmann/osadl-matrix"
license=('Unlicense' 'CCPL:by-4.0')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

package() {
  cd "${pkgname##python-}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('ff7af61c934cd126f9b635a7344b5b2d16a3e579c9c35618efaf5cfd2101219c')

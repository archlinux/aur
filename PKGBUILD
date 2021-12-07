# Maintainer: robertfoster
pkgname=python-osadl-matrix
pkgver=2021.11.02.091119
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

sha256sums=('3ba0a4b19d43c414521b1a42a402139a06d26652073c2e34f8059c829902812a')

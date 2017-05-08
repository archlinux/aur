# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=colored
pkgname=python-colored
pkgver=1.3.5
pkgrel=1
pkgdesc='Very simple Python library for color and formatting in terminal'
arch=('any')
url="https://github.com/dslackw/${_projname}"
license=('GPL3')
depends=('python')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dslackw/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('ca6c293878733c8b25e49b439b7adc91a6df837f30bc82332c5a47ca02f1b478')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
}


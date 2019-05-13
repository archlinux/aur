# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=colored
pkgname=python-colored
pkgver=1.3.93
pkgrel=3
pkgdesc='Very simple Python library for color and formatting in terminal'
arch=('any')
url="https://gitlab.com/dslackw/${_projname}"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/dslackw/${_projname}/-/archive/${pkgver}/colored-${pkgver}.tar.gz")
sha256sums=('a8854f55bb372140fe1c4b3484f0750c6cdf9d89c06b82940c399b36307e5d74')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
}


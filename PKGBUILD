# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=colored
pkgname=python-colored
pkgver=1.3.4
pkgrel=1
pkgdesc='Very simple Python library for color and formatting in terminal'
arch=('any')
url="https://github.com/dslackw/${_projname}"
license=('GPL3')
depends=('python')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dslackw/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('fae17e21712ca5b2c5923e4d13dcce3036770d5652467a9e70bbd9ddab0cedce')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
}


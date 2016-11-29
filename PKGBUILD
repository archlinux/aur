# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=colored
pkgname=python-colored
pkgver=1.3.3
pkgrel=1
pkgdesc='Very simple Python library for color and formatting in terminal'
arch=('any')
url="https://github.com/dslackw/${_projname}"
license=('GPL3')
depends=('python')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dslackw/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('f9ea13f3805b62b20c0727f699c7e81a')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
}


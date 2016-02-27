# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=colored
pkgname=python-colored
pkgver=1.2.1
pkgrel=1
pkgdesc='Very simple Python library for color and formatting in terminal'
arch=('any')
url="https://github.com/dslackw/${_projname}"
license=('GPL3')
depends=('python')
source=("https://github.com/dslackw/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('1abd50f675d7856149b57c2dfb483e63')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
}

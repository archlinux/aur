# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_pkgname=simplekml
pkgname=python-simplekml
pkgver=1.2.8
pkgrel=1
pkgdesc='Simplekml is a python package which enables you to generate KML with as little effort as possible.'
arch=('any')
url="http://www.simplekml.com/"
license=('GPL3')
depends=('python')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.zip")
md5sums=('16ac3ad2639c7e50ec769baf33a0278e')

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}

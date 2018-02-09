# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

_pkgname=pykml
pkgname=python-pykml
pkgver=0.1.3
pkgrel=1
pkgdesc='pyKML is a Python package for parsing and authoring KML documents.'
arch=('any')
url="https://pythonhosted.org/pykml/"
license=('BSD')
depends=('python')
source=('https://pypi.python.org/packages/8f/16/276e16f024db5aca4c8891cecd56219a5a1e016fa356e858dfb04590b1d5/pykml-0.1.3.tar.gz')
md5sums=('bc5c499b4e16cf51d502f9c828284f96')

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}

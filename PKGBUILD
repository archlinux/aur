# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>

_pkgname=pykml
pkgname=python-pykml
pkgver=0.2.0
pkgrel=1
pkgdesc='pyKML is a Python package for parsing and authoring KML documents.'
arch=('any')
url="https://pythonhosted.org/pykml/"
license=('BSD')
depends=('python' 'python-lxml')
source=('https://files.pythonhosted.org/packages/8c/1e/56db25550a3de6401c8f08216530bd2f96b9e9b463598d6e2190229bee12/pykml-0.2.0.tar.gz')
md5sums=('d99ec70275e9dc12e3d81828b18d3764')
package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}

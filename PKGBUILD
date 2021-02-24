# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-cherrypy-cors
_pkgname=cherrypy-cors
pkgver=1.6
pkgrel=1
pkgdesc="CORS support for CherryPy"
arch=('any')
url="https://pypi.org/project/cherrypy-cors/"
license=('MIT')
depends=('python' 'python-cherrypy' 'python-httpagentparser')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f7fb75f6e617ce29c9ec3fdd8b1ff6ec64fec2c56371182525e22bcf4c180513')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

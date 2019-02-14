# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-json2html
pkgname=('python-json2html' 'python2-json2html')
_pypiname=json2html
pkgver=1.2.1
pkgrel=1
pkgdesc="Python wrapper to convert JSON into a human readable HTML Table representation."
url="https://pypi.org/project/json2html/"
arch=('any')
license=('MIT')
depends=( 'python-simplejson' 'python-ordereddict' )
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/23/33/e6367858c5da6795d3277e9ea4e58a70a7fd55f97f4bcc90b1ecec1c1410/json2html-${pkgver}.tar.gz)
sha256sums=('a6c9cdb4ae09db1fe37e895eb706cb8cafcbf30a168e806d9ce105f3839f0d70')

package_python-json2html() {
  depends=('python-simplejson' 'python-ordereddict')
  makedepends=('python-setuptools')
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-json2html() {
  depends=('python2-simplejson' 'python2-ordereddict')
  makedepends=('python2-setuptools')
  cd ${_pypiname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}



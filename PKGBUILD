# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-json2html
pkgname=('python-json2html' 'python2-json2html')
_pkgname=json2html
pkgver=1.2.1
pkgrel=1
pkgdesc="Python wrapper to convert JSON into a human readable HTML Table representation."
url="https://pypi.org/project/json2html/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a6c9cdb4ae09db1fe37e895eb706cb8cafcbf30a168e806d9ce105f3839f0d70')

package_python-json2html() {
  depends=('python-simplejson' 'python-ordereddict')
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-json2html() {
  depends=('python2-simplejson' 'python2-ordereddict')
  cd ${_pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}



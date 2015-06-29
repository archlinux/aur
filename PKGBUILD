# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=('python-plaintable' 'python2-plaintable')
pkgbase=python-plaintable
_pkgname=plaintable
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple library to build plain text tables"
arch=('any')
url="https://github.com/rumpelsepp/plaintable"
license=('MIT')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
makedepends=('python2-setuptools' 'python-setuptools')
md5sums=('dc416d957ffdc64db5c979f7cb9b54b6')

package_python-plaintable() {
  provides=('python-plaintable')
  conflicts=('python-plaintable-git')
  depends=('python')

  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-plaintable() {
  provides=('python2-plaintable')
  conflicts=('python2-plaintable-git')
  depends=('python2')

  cd "$srcdir/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

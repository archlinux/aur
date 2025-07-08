# Maintainer: Jose Riha <jose1711 gmail com>
 
pkgname=python-pyscreeze
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple, cross-platform screenshot module for Python 2 and 3."
arch=('any')
url="https://github.com/asweigart/pyscreeze"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pillow')
source=(https://files.pythonhosted.org/packages/ee/f0/cb456ac4f1a73723d5b866933b7986f02bacea27516629c00f8e7da94c2d/pyscreeze-1.0.1.tar.gz)
md5sums=('bdf395e46d7de4918323742b856cb7d7')

package() {
  cd "$srcdir/pyscreeze-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

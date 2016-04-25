# $Id$
# Maintainer: Fabien Devaux <fdev 31 @ gmail dot com>
# Contributor: Chris Longo <chris . longo @ gmail dot com>

pkgname=ghost.py
_uc_pkg=Ghost.py
pkgver=0.2.3
pkgrel=2
pkgdesc="Webkit based webclient (relies on PyQT)"
arch=('any')
url="http://jeanphix.github.com/$_uc_pkg/"
license=('MIT')
depends=('python' 'python-pyqt5')
makedepends=('python-setuptools')
source=(http://pypi.python.org/packages/source/G/$_uc_pkg/$_uc_pkg-$pkgver.tar.gz)
md5sums=('310197fbb4f852e7ce50767b9c822bdf')

package() {
   cd $_uc_pkg-$pkgver 
   python setup.py build || exit 1
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}


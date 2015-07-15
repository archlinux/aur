# $Id$
# Maintainer: Fabien Devaux <fdev 31 @ gmail dot com>
# Contributor: Chris Longo <chris . longo @ gmail dot com>

pkgname=ghost.py
_uc_pkg=Ghost.py
pkgver=0.1.1
pkgrel=1
pkgdesc="Webkit based webclient (relies on PyQT)"
arch=('any')
url="http://jeanphix.github.com/$_uc_pkg/"
license=('MIT')
depends=('python2' 'python2-pyqt')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/G/$_uc_pkg/$_uc_pkg-$pkgver.tar.gz)
md5sums=('8ea797161ef3173a9cb6860533d79d18')

package() {
   cd $_uc_pkg-$pkgver 
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}


# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=python2-pyg
pkgver=1.0
pkgrel=1
pkgdesc="Pyg package installer"
arch=('any')
url="http://bitbucket.org/rubik/pyg/"
license=('MIT')
depends=('python2' 'python2-distribute' 'python2-pkgtools' 'python2-argh')
provides=('pyg')
source=(http://pypi.python.org/packages/source/p/pyg/pyg-${pkgver}.tar.gz)
md5sums=('f264abf7d290afbb3cb6235f2926678a')

build() {
   cd "${srcdir}/pyg-${pkgver}"
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

pkgname=python2-pkgtools
pkgver=0.7.3
pkgrel=1
pkgdesc="Python packages tools"
arch=('any')
url="http://pkgtools.readthedocs.org/en/latest/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/pkgtools/pkgtools-${pkgver}.tar.gz)
md5sums=('f23b4aaf2fb4893df8f5225a9edb6a07')

build() {
   cd "${srcdir}/pkgtools-${pkgver}"
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}


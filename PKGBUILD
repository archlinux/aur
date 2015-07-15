# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=python2-windmill
pkgver=1.6
pkgrel=1
pkgdesc="Windmill Web Tester"
arch=('any')
url="http://www.getwindmill.com/"
license=('MIT')
depends=('python2' 'python2-distribute')
provides=('windmill')
source=(http://pypi.python.org/packages/source/w/windmill/windmill-${pkgver}.tar.gz)
md5sums=('56eb5bd57a52d8e762b488e647e5efb4')

build() {
   cd "${srcdir}/windmill-${pkgver}"
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

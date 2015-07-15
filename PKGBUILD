# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=python2-odict
provides=('odict')
pkgver=1.5.1
pkgrel=1
pkgdesc="Ordered dictionary."
arch=('any')
url="https://github.com/bluedynamics/odict"
license=('PSF')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/o/odict/odict-${pkgver}.tar.gz)
md5sums=('77ded25c29035b68574383a08af2bdf1')

build() {
   cd "${srcdir}/odict-${pkgver}"
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}


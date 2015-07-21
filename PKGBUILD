# $Id$
# Maintainer: Pedro Martinez-Julia <pedromj@um.es>

pkgname=python2-pyhash
pkgver=0.6.2
pkgrel=1
pkgdesc="Python Non-cryptographic Hash Library"
url="http://code.google.com/p/pyfasthash/"
license=('Apache 2.0')
depends=('python2' 'boost-libs')
makedepends=('python2-distribute' 'boost')
arch=('any')
source=("https://github.com/flier/pyfasthash/archive/${pkgver}.tar.gz")
sha1sums=('e703ff597cd8db8bfd83f44f0e42e7ac9153c302')

package() {
  cd "${srcdir}/pyfasthash-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}

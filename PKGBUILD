# Maintainer: masutu <masutu dot arch at gmail dot>
pkgname=python2-pysox
pkgver=0.3.6.alpha
pkgrel=1
pkgdesc="Python bindings for libsox"
arch=('i686' 'x86_64')
url="http://foo42.de/wiki/pysox/"
license=('BSD')
depends=('python2' 'sox')
options=(!emptydirs)
source=('http://foo42.de/devel/pysox/dist/pysox-0.3.6.alpha.tar.gz')
md5sums=('08c6eed8ff29f1b6756558cf545fe3be')

package() {
  cd "$srcdir/pysox-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

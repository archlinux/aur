# Maintainer: Maxime Arthaud <maxime@arthaud.me>
 
pkgname=python2-pyode
pkgver=20100322
pkgrel=1
pkgdesc="A set of open-source Python bindings for The Open Dynamics Engine (ODE)"
arch=('i686' 'x86_64')
url="http://pyode.sourceforge.net/"
license=('LGPL2.1')
depends=('python2>=2.2' 'ode>=0.7')
makedepends=('pyrex')
source=('http://downloads.sourceforge.net/project/pyode/pyode/snapshot-2010-03-22/PyODE-snapshot-2010-03-22.tar.bz2')
md5sums=('556f563f3623ec1167648021cccb8d05')
 
build() {
  cd "$srcdir/PyODE-snapshot-2010-03-22"
  python2 setup.py build
}

package() {
  cd "$srcdir/PyODE-snapshot-2010-03-22"
  python2 setup.py install --root="$pkgdir"
}

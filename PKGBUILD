# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-pymbar
pkgver=3.0.0.beta2
pkgrel=1
pkgdesc="Python implementation of the multistate Bennett acceptance ratio (MBAR) method for estimating expectations and free energy differences. "
arch=('i686' 'x86_64')
url="https://github.com/choderalab/pymbar"
license=('LGPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-six')
optdepends=('python2-nose: nosetests')
source=(https://github.com/choderalab/pymbar/archive/${pkgver}.tar.gz)
md5sums=('7bdefca83f0cd9be35e8d3d5795f25c8')

package() {
	cd "$srcdir/pymbar-$pkgver"
    python2 setup.py install --root=$pkgdir || return 1
}

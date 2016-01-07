# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-brian
pkgver=1.4.1
pkgrel=1
pkgdesc="A clock-driven simulator for spiking neural networks"
arch=('any')
url="briansimulator.org/"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-sympy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/b/brian/brian-1.4.1.tar.gz")
md5sums=('eae71f4755884b0abebd549e13f0a826')

package() {
  cd "$srcdir/brian-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

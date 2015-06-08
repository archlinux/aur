
pkgname=python2-pacal
pkgver=1.5
pkgrel=1
pkgdesc="ProbAbilistic CALculator"
url="http://pacal.sourceforge.net/"
arch=(any)
license=('GPL')
depends=('python2-scipy' 'python2-sympy' 'python2-matplotlib')
makedepends=('cython')
source=("http://download.sourceforge.net/sourceforge/pacal/PaCal-${pkgver}.tar.gz")
md5sums=('8c8dbfa2db6907bb5f3328e68ffa123c')

build() {
  cd "${srcdir}/PaCal-$pkgver"
  python2 setup.py build
} 

package() {
  cd "${srcdir}/PaCal-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}


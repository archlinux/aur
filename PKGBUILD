pkgname=python-hope
pkgver=0.7.3
pkgrel=1
pkgdesc="A Python Just-In-Time compiler for astrophysical computations"
url="https://github.com/cosmo-ethz/hope"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-sympy')
source=("https://pypi.io/packages/source/h/hope/hope-${pkgver}.tar.gz")
sha256sums=('f038b44da0b787f6ac5d07c21fdb51bfef953d9c039427e4097dbb7ffbb79a79')

build() {
  cd "${srcdir}"/hope-$pkgver
  python setup.py build
} 

package() {
  cd "${srcdir}"/hope-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}



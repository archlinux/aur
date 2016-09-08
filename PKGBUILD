pkgname=python-parmed
pkgver=2.5.1
pkgrel=1
pkgdesc="Parameter/topology editor and molecular simulator"
arch=('i686' 'x86_64')
url="https://parmed.github.io/ParmEd/html/index.html"
depends=('python')
license=('MIT' 'LGPL')
source=("https://github.com/ParmEd/ParmEd/archive/${pkgver}.tar.gz")
md5sums=('7540604f3069b4933aeb5528e0769959')

package() {
  cd ${srcdir}/ParmEd-${pkgver}
  python setup.py install --root=${pkgdir} || 1
}

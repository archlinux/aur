pkgname=python-parmed
pkgver=2.7.1
pkgrel=1
pkgdesc="Parameter/topology editor and molecular simulator"
arch=('i686' 'x86_64')
url="https://parmed.github.io/ParmEd/html/index.html"
depends=('python')
license=('MIT' 'LGPL')
source=("https://github.com/ParmEd/ParmEd/archive/${pkgver}.tar.gz")
sha512sums=('1f056d6b5f6ae2cea77d7781a5d3ab95ebbe304005c2d493c8222944d30dd9c0af1e17492d03e864cea15e405eb0561ce0c04c4414a4a8153230f24878df1f1a')

package() {
  cd ${srcdir}/ParmEd-${pkgver}
  python setup.py install --root=${pkgdir} || 1
}

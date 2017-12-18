# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-polo'
pkgver=0.4
pkgrel=1
pkgdesc="Python optimal leaf ordering for hierarchical clustering"
arch=('any')
url="https://github.com/adrianveres/polo"
license=('MIT')
depends=('python' 'python-numpy>=1.9.2' 'python-scipy')
makedepends=('cython' 'python-setuptools')
provides=('python-polo')
conflicts=('python-polo')
options=(!emptydirs)
source=("https://github.com/adrianveres/polo/archive/${pkgver}.tar.gz")
md5sums=('a5d3d2b09b18b34b4e368b1936197fd6')

package() {
  cd "${srcdir}/polo-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

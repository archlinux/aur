
pkgname=python-openmdao
pkgver=1.1.1
pkgrel=1
pkgdesc="An open-source engineering analysis framework"
url="http://openmdao.org/"
arch=(any)
license=('apache')
depends=('python-scipy' 'python-networkx')
makedepends=('python-setuptools')
source=("https://github.com/OpenMDAO/OpenMDAO/archive/${pkgver}.tar.gz")
md5sums=('3265ba4b909efbb56e36cf77d282b2fe')


build() {
  cd "${srcdir}/OpenMDAO-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/OpenMDAO-$pkgver"
  python setup.py install --root="${pkgdir}"
}

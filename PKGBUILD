
pkgname=python-pyinter
pkgver=0.1.6
pkgrel=1
pkgdesc="An interval interval arithmetics package"
url="https://github.com/intiocean/pyinter"
arch=(any)
license=('MIT')
depends=('python')
makdedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('f1336ebf94899a359ccf824e85a858b1')

build() {
  cd "${srcdir}/pyinter-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/pyinter-$pkgver"
  python setup.py install --root=${pkgdir}
}

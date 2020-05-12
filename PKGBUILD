pkgname=python-pyorgmode
pkgver=0.03b
pkgrel=1
pkgdesc="A python class for reading and writing orgmode files"
url="https://github.com/gonvaled/PyOrgMode"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/gonvaled/PyOrgMode/archive/${pkgver}.tar.gz")
sha256sums=('c7b155a312e84ad10508b4f309482c4b69f45428f5eb83e7f8606db15e213f5c')

build() {
  cd "${srcdir}"/PyOrgMode-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/PyOrgMode-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


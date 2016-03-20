# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=infinity
pkgname="python-${_name}"
pkgver=1.3
pkgrel=1
pkgdesc='All-in-one infinity value for Python. Can be compared to any object.'
url='https://github.com/kvesteri/infinity'
depends=('python' 'python-total-ordering')
makedepends=('python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('0aa8feadec140b7d091bac142411e6d9')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: M0Rf30

pkgname=python2-txrestapi
_pkgsrcname=txrestapi
pkgver=0.2
pkgrel=1
pkgdesc="Easing the creation of REST API services in Python"
url="https://github.com/iancmcc/txrestapi"
license=("MIT")
arch=("any")
depends=('python2')
source=("https://pypi.python.org/packages/source/t/txrestapi/${_pkgsrcname}-${pkgver}.tar.gz")

build() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}

md5sums=('9fbe99e72444a1d3df52086f0400978c')

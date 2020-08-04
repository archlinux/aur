# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_tolerance
_name=trytond_sale_shipment_tolerance
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc=""
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9fe8b8df938d0b63438f38d919d38c2e33e064ce0715dbb1b4446f527da61b19')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

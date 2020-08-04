# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_shipment_measurements
_name=trytond_stock_shipment_measurements
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
sha256sums=('c1bf7b01e0860cebe55a33d952410ff793cf87754d88f7f84cd52f0e2bb748b8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_cost
_name=trytond_sale_shipment_cost
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
sha256sums=('23d196f7c2fd4541e69cdc0676d095867d302c5a5473a4e38b9ca37e9c4d4878')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_shipment_cost
_name=trytond_purchase_shipment_cost
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for purchase shipment cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9cb3fe73ef734c0294eb9707111289c1850bc438a82ef8553c19787204c4a8d')
sha512sums=('5760dbeda3d2e33407c66f350582ce9ce1e7eb3585a6ef6ba83b89be900d26b81da5310d8ef43c49d89e131ce2a59aa130cf714649a48a6ab9b925ba6d2809b0')
b2sums=('b9d962fb5c076aa735f62b4fbef7d10b6007fd9fd7123c46249065857c0c925d9872f37835150c8db3a9887b49a31a0ad759e3ce1fa982ba9d2b9755956ecc57')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

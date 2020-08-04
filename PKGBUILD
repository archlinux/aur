# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_grouping
_name=trytond_sale_shipment_grouping
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
sha256sums=('a1ae1348b8b88e4b340f24d09233f562c4cd1b322bc7b3efda1927c13bf53ae4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

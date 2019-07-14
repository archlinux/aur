# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_day
_name=trytond_stock_supply_day
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add supply weekdays"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b4ea64a1f49ea58d6d0c5ad1dc6abafed485a1d4157ffee6d10640e1792aad79')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

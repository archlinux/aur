# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_promotion
_name=trytond_sale_promotion
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for sale promotion"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e7ea1dfb297dffa0b6cdb1266f42aa5ca85afc6d9defab0dad08f6afa9b85164')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

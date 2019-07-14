# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_supply
_name=trytond_sale_supply
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for sale supply"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f92b7b667b75855b7540f20ac633124116429af1dce326ac51bb4ae126f732f5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_promotion_coupon
_name=trytond_sale_promotion_coupon
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale promotion coupon"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('99967b59ada42d55641ea4b5ab8a0e2db04280741971c94680848eb4d20a5253')
sha512sums=('a067bb7e6d6b323c24b185952321bbc14592e7e1800ea7ea3c27e52308735bda85a75c9d55667138d6afd3d7fd6df36a3dc45219dcda2bcefc02f217da98d4be')
b2sums=('600ae7f800188814d24f7b2904d97668ef985c9f81c35a03cbbcaf635faea76222e137190c873387575c4c367cca2422c10bfcf09d39541d74e3af84c45f608b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

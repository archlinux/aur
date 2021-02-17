# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shop_vue_storefront
_name=trytond_web_shop_vue_storefront
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to integrate with Vue Storefront"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c718c90b542600bf3368ce74b61596fd849642b7919b551bd518e3bb05548659')
sha512sums=('5564adf15b2527a3fd580830d59da25bc17ab45198a64a4b26bc858ba8343d83f1fcc8794e04ffaa74e0385c5cea9d800282bd6765f94d47a2e3bd0242e34bc4')
b2sums=('27fae9e76bce22ffb9a0bab0b48591dd651b6362182250fce2614dd7f96ee89e2863f31b1648871689781749e1d981051dc5e319bad8bf8190979dca823fabb8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

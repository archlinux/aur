# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shop_vue_storefront
_name=trytond_web_shop_vue_storefront
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to integrate with Vue Storefront"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4e62f868fae5bf9b96e6b09e4383f663ebfcf9cfc0e27c22ad8368f60894aea5')
sha512sums=('affd1525c5cce42eb78dcb251720ae384875dce64f8f48116c67feb6def444bd0df2b3f8e861fae92324a4f5d325c08e5b026588b9489dcc872622d27f31857b')
b2sums=('caddec220f698965a11a05012da36dff8fe839b12a854a66d2f6944f82b2f5297f1e2b00ee5cf136978caaea7cdbaa4f5273d1dd05bbbb81252e020d9f525857')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

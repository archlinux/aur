# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shop_vue_storefront_stripe
_name=trytond_web_shop_vue_storefront_stripe
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to support Stripe payment with Vue Storefront"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3f3ef2f4a8ec80bff7b4d794938ccd37d4e3f66b5778385a771feaba9733d238')
sha512sums=('8f935f88a2515ac64129bddc23529de6d740fa6081d532cd1396c5c497f8cc647a0d61b67b1cfc6ef8379a410713f549db2e964e7f6691b000e5f6ce39d33199')
b2sums=('77e26a1b651ed83142d97f7ffe939c0f4df82ccac4045f50a878d7c5a41dcbd5253892803c13d46ec4fd7f65c80f12a0040cf0c98cd847df2e1b0890b192c8e6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_advance_payment
_name=trytond_sale_advance_payment
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale advance payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('48d243a6d1e66c529afe3dfe6c44366cef7a5971d2c3878d0e0094d92c03ebae')
sha512sums=('73964d546c7cc239dd1c249a0098979e8250dfbbbbdf473407894d2b9755f0dcd5c053ae884cf53d31cc61917531d7bc54f5bcf14f6f538017499a2e6b1611a6')
b2sums=('95dbdf47bf1e7a2612cac54e2701779a9f42d8c042f993078b7dafd0312b6b6177ed05ce727d68b65551fe56f83cea5f88e4c9646a20c76d820d088e2ab9df06')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

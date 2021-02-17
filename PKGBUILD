# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_price_list_dates
_name=trytond_product_price_list_dates
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add dates on price list"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d48626cb0aef0345ca910a90ed7af26208f1fa196f099e2f9f2ab1c7c694c418')
sha512sums=('0ff704b233b39bc4115ee0f365499ad8c472c0b141a9b17e8f5a2e868861908ddfb0fd66f8ea021f6713ef2e8a958ae8bd73d11c72d86664dd48695903e5c592')
b2sums=('7c71246a09a052ebc8634b56e3decbac62b1bf3624f5cd89eee26122ed057f7b5a01978d9e674bec82144745f8b16e2359963513b66935264fa963cd9e99d251')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

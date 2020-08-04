# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package_shipping_dpd
_name=trytond_stock_package_shipping_dpd
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
sha256sums=('67fb28260b6137a1185966bf3f36468bfc44a6dc71b2a27aa991d1de8ea0e46a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

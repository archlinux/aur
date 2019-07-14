# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_commission
_name=trytond_commission
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for commission"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0420ea109f01864e0a11fc54cdddacd07652718396c3a939ca4105a2d3601ca4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

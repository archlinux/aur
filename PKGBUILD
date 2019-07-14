# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier_percentage
_name=trytond_carrier_percentage
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add cost method "on percentage" on carrier"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8071be18d903991763cd1ddcd92b7d288f9dbfcb8d839877a5f86cfcca7e4b1d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

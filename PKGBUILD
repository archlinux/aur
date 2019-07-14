# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_complaint
_name=trytond_sale_complaint
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for sale complaint"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ffe527dea6ae782365ca4aaa087e64e94a4744a8d6ea6ef30a657c9a5a4e14b5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_measurements
_name=trytond_product_measurements
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add measurements to product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fe2257bf7dbf064133d1f153bfd77f8b3ff1c2669f60c685a5648f12b5fdb0e1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

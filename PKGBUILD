# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_classification_taxonomic
_name=trytond_product_classification_taxonomic
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to implement product classification taxonomic"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f22f5594964e01ddc5e033549e8da2eba4a630fc7788eb52268945fb64abe69e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

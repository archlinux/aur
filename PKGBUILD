# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_classification_taxonomic
_name=trytond_product_classification_taxonomic
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to implement product classification taxonomic"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c72ad4369e121506b40353b7f0662b5c0252ef961fa3bfca30a71639b98639cc')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

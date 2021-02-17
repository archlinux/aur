# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_classification_taxonomic
_name=trytond_product_classification_taxonomic
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to implement product classification taxonomic"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('10bdda239e2ed3d9e8e9f6d259f412ef934d87024833106c743717fda0d02df8')
sha512sums=('6498fa849f6873d5e14a9c8987c8802470dde488c46b710f477547d8db878d7b6e81bfd10e1f2a8da0bab2b78fd251b20cd2e874a0a160514d07d7366d538852')
b2sums=('a476b587bf025e133c9929f65dfea5618058f57bea0acaf791247a37733519c8c5f2094c599a60be6772706639ceaaa04413a4b35a8e42e1c58dc4601d74619b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

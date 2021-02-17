# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier_weight
_name=trytond_carrier_weight
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add cost method on weight on carrier"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('72876d278c80e64034fa5a4f6b68afba06b4335b8689a6d715747f2394a89d2d')
sha512sums=('009548a8ece146a3ad13978c8d23463f0b72fee9bb4295693042cbc575b1119b92131c46697253cd1c9b5899f0aa086959896bb1bd6c9cc41467153e5d0f7e0f')
b2sums=('871c277a80c8817206fef7672d0af691088ff4659c96005c200e8bcee84b1275774eae153521bb1185128bc8a65098e7412243ea00cccc1809757a197b681115')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

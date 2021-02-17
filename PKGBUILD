# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_location_sequence
_name=trytond_stock_location_sequence
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add sequence on location"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('95cc7a33f12e4bbd6c58ad529818b6a67a6280fd5e7711db685c7d4cf675b224')
sha512sums=('078b5c5438bf3c4a16af65f248dd23a7f525421dac9b73c4a39c8c8e7b6d29225d4efac52ce62e771dac65b8ce3d6a25b165d2864bf98f042d832b9714fd3537')
b2sums=('3193a756401a8b423fb82a892e4cd3c879dcab4d43d2f1863d0cd1e6b2b868cf08f620f55c1fa0ba8b5e8ead59d342e710078f8c661043706269618c414b83ce')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

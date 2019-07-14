# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier_weight
_name=trytond_carrier_weight
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add cost method "on weight" on carrier"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ba14300212a5a9d59d524f1a7cbdedc0845ff88273a512a82380f9a6863f2a45')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

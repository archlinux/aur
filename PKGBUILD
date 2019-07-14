# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_commission_waiting
_name=trytond_commission_waiting
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for commission waiting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ee45c60302eae85e6823cb359bf02156350ab01b563dff269b5b088642c9e93d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

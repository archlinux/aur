# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_pe
_name=trytond_party_pe
pkgver=4.2.3
_pkgdir=4.2
pkgrel=1
pkgdesc="Peruvian localization for the party module"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6186d77a8203a9e7f6b493048f3fd550dec364d945cfbb1a134674c9e3a0fc5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

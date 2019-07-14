# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_ofx
_name=trytond_account_statement_ofx
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to import OFX statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('edbca5674f9085ed72d2919842ceb7435b558cc0a9d0956128c86e973d005b1b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning_fee
_name=trytond_account_dunning_fee
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for account dunning fee"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5b4f9f8bcd3e1780e6991123b0840af7a2e9512ab6d2380e057c9114d37f2569')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

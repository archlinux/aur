# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_pe
_name=trytond_account_pe
pkgver=4.2.0
_pkgdir=4.2
pkgrel=1
pkgdesc="Peruvian localization for account module"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('650fee58e2590bc73a150552424017862819b586fb5cd9bbeb390c207d7e8f2a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

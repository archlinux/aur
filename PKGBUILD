# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning_email
_name=trytond_account_dunning_email
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for account dunning email"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d631a86e5b8e7e2a12c1ad61922200b574b7959f3b54e3243290be5429b388c5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_fr
_name=trytond_account_fr
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with French chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7a900e2b5eea587eff34292c7ab5f274c974eee0302eb85d8a59dec75d69d59e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

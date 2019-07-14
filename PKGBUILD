# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_es
_name=trytond_account_es
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton with Spanish chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a74942f6f4aeae58b3c64acafedee939e61812bc8bc477f1e8b2d428e831e42c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

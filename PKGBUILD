# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_unece
_name=trytond_edocument_unece
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for electronic document UNECE codes"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cfe2fb017c7e20dd728591bfa38cd59e2e50269e350d2b694efdb7ae9ee1be4c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

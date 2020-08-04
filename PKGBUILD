# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_cost_fifo
_name=trytond_product_cost_fifo
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc=""
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ef4cfdb4bab5fbe0ef7fd7ce23c86ea51fddf87a3661a252796e8cbfcde924ed')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

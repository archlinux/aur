# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_anglo_saxon
_name=trytond_account_stock_anglo_saxon
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
sha256sums=('aca854cc6ef9a5bb794b53cd967a8583f864565c2b3061cad2ef7b7d969b208d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_landed_cost
_name=trytond_account_stock_landed_cost
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for landed cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c89927bc24c0a534e7e4e2874a182f8b6930b82dc22ba68b0517104259204fd4')
sha512sums=('860929c4f786533cf3ebb7071a33d219dc536890e56e6f27596493fdf18cc8d4416e0cbc0e97f9d76f6ce5d366d47221764be4639016cecd55f4e807dc3cb374')
b2sums=('d44a8a6200565b44c678d4a3810cfd40b70b828c0acc70b967cb836b96ee3b23dfe44cb7ab715434d62beda9963b82f6082029421c1df32eca82435fd8e8acdb')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

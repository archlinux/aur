# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_extra
_name=trytond_sale_extra
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for sale extra"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('42611bc4dcb5c66761423858ab0a9504d7586233dec475f84a6deb065d0e82fd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

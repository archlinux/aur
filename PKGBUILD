# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_unece
_name=trytond_edocument_unece
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for electronic document UNECE codes"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('84170cdad3f52ee2b8d67146777cd697c0e66be15b06232830310d6f5c026644')
sha512sums=('9eac1c5a442c6ada9f6fa5221299c5ae57568bc42c5fbf7c9304883bb57552da5c881ec854f1fb4663d0674b09419cf62aeb5413c0b95bbca3c63ac2e09f81cc')
b2sums=('79def8dd94311da2979f43ebd298da8ea1e2cd2f793564500fe3e95ebe82efec2aaf6bcd01788898857868eb91a35dfb285949990b048102a0a89e45817aee13')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

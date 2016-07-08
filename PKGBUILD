# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=dbfread
pkgname=python-$_pkgname
pkgver=2.0.6
pkgrel=1
pkgdesc="Read DBF Files with Python"
arch=('any')
url="https://dbfread.readthedocs.io"
license=('MIT')

source=("https://pypi.python.org/packages/92/8b/b7b5d0b9971f4ef8c9f5b4db157a104104a904927c5eecfe5016baf6d356/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('e2e30e0cee4b640a7bcea01de2eae383be9840c4a04028032fdd2ddcd5b86e12')

# vim:set ts=2 sw=2 et:

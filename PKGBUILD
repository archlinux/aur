# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-reparser
_pkgname=reparser
pkgver=1.4.3
pkgrel=1
pkgdesc="Simple regex-based lexer/parser for inline markup"
arch=('any')
url="https://github.com/xmikos/reparser"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/reparser/archive/v$pkgver.tar.gz)
md5sums=('06f6321a8c6f0bd247d85db2eeb644ea')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:

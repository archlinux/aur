# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=qhangups
pkgver=1.7.1
pkgrel=1
pkgdesc="Alternative client for Google Hangouts written in PyQt"
arch=('any')
url="https://github.com/xmikos/qhangups"
license=('GPL3')
depends=('hangups-git' 'python-quamash' 'python-pyqt5' 'python-appdirs')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/qhangups/archive/v$pkgver.tar.gz)
sha256sums=('3ea76e0d0c497e736b77cde790062b42ea9e3ee4c2f2add9e4b85a5ecc8ac9dc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Mathieu Westphal <mathieu.westphal@gmail.com>

pkgname=python2-spidev
pkgver=1.0
pkgrel=1
pkgdesc="Python2 bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/rpodgorny/py-spidev"
license=('GPL')
depends=('python2')
makedepends=('git')
source=($pkgname::git://github.com/rpodgorny/py-spidev)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

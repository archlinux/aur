# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=python-spidev
pkgver=2.0
pkgrel=1
pkgdesc="Python bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/rpodgorny/py-spidev"
license=('GPL')
depends=('python')
makedepends=('git')
source=($pkgname::git://github.com/rpodgorny/py-spidev)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
